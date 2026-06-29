from time import perf_counter
import argparse

import numpy as np
import pandas as pd
from pynq import Overlay, allocate


AP_CTRL = 0x00
INPUT_ARRAY_LOW = 0x10
INPUT_ARRAY_HIGH = 0x14
VAL_LOW = 0x1C
VAL_HIGH = 0x20


def split_addr(addr):
    return addr & 0xFFFFFFFF, (addr >> 32) & 0xFFFFFFFF


def wait_done(ip, timeout_s=5.0):
    start = perf_counter()
    while True:
        ctrl = ip.read(AP_CTRL)
        if ctrl & 0x2:
            return ctrl
        if perf_counter() - start > timeout_s:
            raise TimeoutError(f"linear_transformer IP timeout, AP_CTRL=0x{ctrl:08x}")


def run_one(ip, input_buffer, output_buffer, values):
    input_buffer[:] = values.astype(np.float32)
    output_buffer[:] = np.float32(-1234567.0)
    input_buffer.flush()
    output_buffer.flush()

    in_low, in_high = split_addr(input_buffer.physical_address)
    out_low, out_high = split_addr(output_buffer.physical_address)

    ip.write(INPUT_ARRAY_LOW, in_low)
    ip.write(INPUT_ARRAY_HIGH, in_high)
    ip.write(VAL_LOW, out_low)
    ip.write(VAL_HIGH, out_high)

    t0 = perf_counter()
    ip.write(AP_CTRL, 0x1)
    ctrl = wait_done(ip)
    t1 = perf_counter()

    output_buffer.invalidate()
    return float(np.float32(output_buffer[0])), float((t1 - t0) * 1e6), int(ctrl)


def parse_args():
    parser = argparse.ArgumentParser(description="Run linear_transformer overlay on a CSV batch.")
    parser.add_argument("--input-csv", default="linear_validation_samples_with_anomalies.csv")
    parser.add_argument("--output-csv", default="linear_fpga_results_with_anomalies.csv")
    parser.add_argument("--bitfile", default="linear_transformer.bit")
    return parser.parse_args()


def main():
    args = parse_args()

    samples = pd.read_csv(args.input_csv)
    x_cols = [f"x{i:02d}" for i in range(16)]
    missing_cols = [col for col in ["sample_id", *x_cols] if col not in samples.columns]
    if missing_cols:
        raise ValueError(f"Missing required columns in {args.input_csv}: {missing_cols}")

    overlay = Overlay(args.bitfile)
    print("IP dictionary keys:", list(overlay.ip_dict.keys()))
    ip = overlay.linear_transformer_0

    input_buffer = allocate(shape=(16,), dtype=np.float32)
    output_buffer = allocate(shape=(1,), dtype=np.float32)

    rows = []
    try:
        for idx, sample in samples.iterrows():
            fpga_score, latency_us, ctrl = run_one(
                ip,
                input_buffer,
                output_buffer,
                sample[x_cols].to_numpy(dtype=np.float32),
            )
            rows.append(
                {
                    "sample_id": int(sample["sample_id"]),
                    "fpga_score": fpga_score,
                    "latency_us": latency_us,
                    "ap_ctrl": ctrl,
                }
            )
            if (idx + 1) % 20 == 0 or (idx + 1) == len(samples):
                print(f"processed {idx + 1}/{len(samples)}")
    finally:
        input_buffer.freebuffer()
        output_buffer.freebuffer()

    pd.DataFrame(rows).to_csv(args.output_csv, index=False)
    print(f"wrote {args.output_csv}")
    print(f"samples {len(rows)}")
    if rows:
        lat = np.array([row["latency_us"] for row in rows], dtype=np.float64)
        print(f"latency_us mean={lat.mean():.3f} min={lat.min():.3f} max={lat.max():.3f}")


if __name__ == "__main__":
    main()

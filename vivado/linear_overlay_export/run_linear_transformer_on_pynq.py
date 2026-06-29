from time import perf_counter

import numpy as np
from pynq import Overlay, allocate


AP_CTRL = 0x00
INPUT_ARRAY_LOW = 0x10
INPUT_ARRAY_HIGH = 0x14
VAL_LOW = 0x1C
VAL_HIGH = 0x20

EXPECTED_CSIM = np.float32(3.5092673)


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


def main():
    overlay = Overlay("linear_transformer.bit")
    print("IP dictionary keys:", list(overlay.ip_dict.keys()))

    ip = overlay.linear_transformer_0

    input_buffer = allocate(shape=(16,), dtype=np.float32)
    output_buffer = allocate(shape=(1,), dtype=np.float32)

    try:
        input_buffer[:] = np.array(
            [
                [0.2, 0.2],
                [0.2, 0.2],
                [0.4, 0.4],
                [0.4, 0.4],
                [0.6, 0.6],
                [0.6, 0.6],
                [0.8, 0.8],
                [0.8, 0.8],
            ],
            dtype=np.float32,
        ).reshape(-1)
        output_buffer[:] = np.float32(-1234567.0)

        input_buffer.flush()
        output_buffer.flush()

        in_low, in_high = split_addr(input_buffer.physical_address)
        out_low, out_high = split_addr(output_buffer.physical_address)

        print("input physical address :", hex(input_buffer.physical_address))
        print("output physical address:", hex(output_buffer.physical_address))

        ip.write(INPUT_ARRAY_LOW, in_low)
        ip.write(INPUT_ARRAY_HIGH, in_high)
        ip.write(VAL_LOW, out_low)
        ip.write(VAL_HIGH, out_high)

        t0 = perf_counter()
        ip.write(AP_CTRL, 0x1)
        ctrl = wait_done(ip)
        t1 = perf_counter()

        output_buffer.invalidate()
        hw_value = np.float32(output_buffer[0])

        print(f"AP_CTRL after run: 0x{ctrl:08x}")
        print("HW output        :", float(hw_value))
        print("Expected C-sim   :", float(EXPECTED_CSIM))
        print("Absolute error   :", float(abs(hw_value - EXPECTED_CSIM)))
        print("Latency us       :", (t1 - t0) * 1e6)
    finally:
        input_buffer.freebuffer()
        output_buffer.freebuffer()


if __name__ == "__main__":
    main()

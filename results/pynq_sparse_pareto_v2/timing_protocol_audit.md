# Timing-protocol audit of QKS-v2

## Finding

The published local number labelled “current model inference time” (1.442–1.552 ms) is not kernel-only, but its exact provenance is not fully reproducible. The checked-in runner times per-sample buffer allocation, input copy/flush, address programming, PL execution, output invalidate/readback/conversion and buffer deletion; it excludes PS argmax and all image preparation. The separate component CSV reports a slightly different 1.475–1.574 ms boundary including a 136–138 µs item labelled decoder/classifier, but its supposed runner is byte-identical to the old runner and cannot have generated those columns.

Accordingly, the current 500× figure is not proven fraudulent, but it is not yet defensible as the main paper claim: the measured CSV boundary lacks its generating source, uses only three repeats, records zero register-setup time, and QKS-v2's static-weight/end-to-end-PL architecture differs materially from ViT4Mal's PS decoder and described patch/matrix-to-BRAM workflow.

Kernel means (about 1004/970/949/911 µs) are supported as PL execution measurements. Full application values (about 18.5–18.8 ms in the consistent breakdown run) include image decode and host preprocessing and are a different, CPU-dominated scope. The older 18–25 ms aggregate mixes host-load variation and must not be substituted silently for either kernel or aligned inference.

The component-by-component disposition and direct code evidence are in `timing_protocol_audit_table.csv`. The strict protocol is in `timing_protocol_definition.md`; strict results must replace, not reinterpret, the preliminary aligned CSV.

## ViT4Mal evidence limitation

The ViT4Mal PDF named in the IDE is absent from the filesystem. The public bibliographic record confirms the PYNQ-Z1 deployment and paper identity (DOI 10.1145/3609112), while Table 13 values and PS/PL descriptions used here are the values supplied with this audit request. Because the paper does not supply an executable timing script, exact boundary identity cannot be established from prose alone.

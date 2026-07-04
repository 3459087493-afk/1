#ifndef HLS_TYPES_H
#define HLS_TYPES_H

#include <ap_fixed.h>

// ── Fixed‑Point Quantization Mode ──
// Convergence rounding; saturation on overflow
#define QM (AP_RND, AP_SAT)

// ── Base types ──
// data_t    – input activations, feature maps
// weight_t  – trained weights (stored as static constants)
// act_t     – activation outputs (elu, relu, layer‑norm results)
// fm_t      – general feature‑map storage (identical to data_t by default)

typedef ap_fixed<16, 6, AP_RND, AP_SAT> data_t;
typedef ap_fixed<16, 6, AP_RND, AP_SAT> weight_t;
typedef ap_fixed<16, 6, AP_RND, AP_SAT> act_t;
typedef ap_fixed<16, 6, AP_RND, AP_SAT> fm_t;

// ── Accumulators (wider to avoid saturation during summation) ──

// linear_acc_t – for standard matrix multiplications (input projection, QKV, FFN, classifier)
//  16-bit operands × 16-bit operands → ~32-bit product; sum over ≤ 32 terms safely in 24 bits
typedef ap_fixed<24, 10, AP_RND, AP_SAT> linear_acc_t;

// attn_acc_t – for attention‑specific accumulations (KV outer, numerator, denominator)
//  attention path has chain of multiply‑accumulate over 16×8 = 128 terms
typedef ap_fixed<28, 12, AP_RND, AP_SAT> attn_acc_t;

// ffn_acc_t – reuse linear_acc_t width for FFN layers (identical rationale)
typedef ap_fixed<24, 10, AP_RND, AP_SAT> ffn_acc_t;

// out_t – final logit type (narrower, same as data_t)
typedef ap_fixed<16, 6, AP_RND, AP_SAT> out_t;

#endif // HLS_TYPES_H
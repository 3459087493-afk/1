// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/SC)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        others - reserved
// 0x10 : Data signal of x0
//        bit 31~0 - x0[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of x1
//        bit 31~0 - x1[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of x2
//        bit 31~0 - x2[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of x3
//        bit 31~0 - x3[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of x4
//        bit 31~0 - x4[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of x5
//        bit 31~0 - x5[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of x6
//        bit 31~0 - x6[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of x7
//        bit 31~0 - x7[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of x8
//        bit 31~0 - x8[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of x9
//        bit 31~0 - x9[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of x10
//        bit 31~0 - x10[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of x11
//        bit 31~0 - x11[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of x12
//        bit 31~0 - x12[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of x13
//        bit 31~0 - x13[31:0] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of x14
//        bit 31~0 - x14[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of x15
//        bit 31~0 - x15[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of val_r
//        bit 31~0 - val_r[31:0] (Read)
// 0x94 : Control signal of val_r
//        bit 0  - val_r_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL    0x00
#define CONTROL_ADDR_GIE        0x04
#define CONTROL_ADDR_IER        0x08
#define CONTROL_ADDR_ISR        0x0c
#define CONTROL_ADDR_X0_DATA    0x10
#define CONTROL_BITS_X0_DATA    32
#define CONTROL_ADDR_X1_DATA    0x18
#define CONTROL_BITS_X1_DATA    32
#define CONTROL_ADDR_X2_DATA    0x20
#define CONTROL_BITS_X2_DATA    32
#define CONTROL_ADDR_X3_DATA    0x28
#define CONTROL_BITS_X3_DATA    32
#define CONTROL_ADDR_X4_DATA    0x30
#define CONTROL_BITS_X4_DATA    32
#define CONTROL_ADDR_X5_DATA    0x38
#define CONTROL_BITS_X5_DATA    32
#define CONTROL_ADDR_X6_DATA    0x40
#define CONTROL_BITS_X6_DATA    32
#define CONTROL_ADDR_X7_DATA    0x48
#define CONTROL_BITS_X7_DATA    32
#define CONTROL_ADDR_X8_DATA    0x50
#define CONTROL_BITS_X8_DATA    32
#define CONTROL_ADDR_X9_DATA    0x58
#define CONTROL_BITS_X9_DATA    32
#define CONTROL_ADDR_X10_DATA   0x60
#define CONTROL_BITS_X10_DATA   32
#define CONTROL_ADDR_X11_DATA   0x68
#define CONTROL_BITS_X11_DATA   32
#define CONTROL_ADDR_X12_DATA   0x70
#define CONTROL_BITS_X12_DATA   32
#define CONTROL_ADDR_X13_DATA   0x78
#define CONTROL_BITS_X13_DATA   32
#define CONTROL_ADDR_X14_DATA   0x80
#define CONTROL_BITS_X14_DATA   32
#define CONTROL_ADDR_X15_DATA   0x88
#define CONTROL_BITS_X15_DATA   32
#define CONTROL_ADDR_VAL_R_DATA 0x90
#define CONTROL_BITS_VAL_R_DATA 32
#define CONTROL_ADDR_VAL_R_CTRL 0x94

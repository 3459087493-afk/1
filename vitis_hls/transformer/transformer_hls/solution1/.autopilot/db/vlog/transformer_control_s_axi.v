// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module transformer_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [31:0]                   x0,
    output wire [31:0]                   x1,
    output wire [31:0]                   x2,
    output wire [31:0]                   x3,
    output wire [31:0]                   x4,
    output wire [31:0]                   x5,
    output wire [31:0]                   x6,
    output wire [31:0]                   x7,
    output wire [31:0]                   x8,
    output wire [31:0]                   x9,
    output wire [31:0]                   x10,
    output wire [31:0]                   x11,
    output wire [31:0]                   x12,
    output wire [31:0]                   x13,
    output wire [31:0]                   x14,
    output wire [31:0]                   x15,
    input  wire [31:0]                   val_r,
    input  wire                          val_r_ap_vld,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL      = 8'h00,
    ADDR_GIE          = 8'h04,
    ADDR_IER          = 8'h08,
    ADDR_ISR          = 8'h0c,
    ADDR_X0_DATA_0    = 8'h10,
    ADDR_X0_CTRL      = 8'h14,
    ADDR_X1_DATA_0    = 8'h18,
    ADDR_X1_CTRL      = 8'h1c,
    ADDR_X2_DATA_0    = 8'h20,
    ADDR_X2_CTRL      = 8'h24,
    ADDR_X3_DATA_0    = 8'h28,
    ADDR_X3_CTRL      = 8'h2c,
    ADDR_X4_DATA_0    = 8'h30,
    ADDR_X4_CTRL      = 8'h34,
    ADDR_X5_DATA_0    = 8'h38,
    ADDR_X5_CTRL      = 8'h3c,
    ADDR_X6_DATA_0    = 8'h40,
    ADDR_X6_CTRL      = 8'h44,
    ADDR_X7_DATA_0    = 8'h48,
    ADDR_X7_CTRL      = 8'h4c,
    ADDR_X8_DATA_0    = 8'h50,
    ADDR_X8_CTRL      = 8'h54,
    ADDR_X9_DATA_0    = 8'h58,
    ADDR_X9_CTRL      = 8'h5c,
    ADDR_X10_DATA_0   = 8'h60,
    ADDR_X10_CTRL     = 8'h64,
    ADDR_X11_DATA_0   = 8'h68,
    ADDR_X11_CTRL     = 8'h6c,
    ADDR_X12_DATA_0   = 8'h70,
    ADDR_X12_CTRL     = 8'h74,
    ADDR_X13_DATA_0   = 8'h78,
    ADDR_X13_CTRL     = 8'h7c,
    ADDR_X14_DATA_0   = 8'h80,
    ADDR_X14_CTRL     = 8'h84,
    ADDR_X15_DATA_0   = 8'h88,
    ADDR_X15_CTRL     = 8'h8c,
    ADDR_VAL_R_DATA_0 = 8'h90,
    ADDR_VAL_R_CTRL   = 8'h94,
    WRIDLE            = 2'd0,
    WRDATA            = 2'd1,
    WRRESP            = 2'd2,
    WRRESET           = 2'd3,
    RDIDLE            = 2'd0,
    RDDATA            = 2'd1,
    RDRESET           = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg                           int_ier = 1'b0;
    reg                           int_isr = 1'b0;
    reg  [31:0]                   int_x0 = 'b0;
    reg  [31:0]                   int_x1 = 'b0;
    reg  [31:0]                   int_x2 = 'b0;
    reg  [31:0]                   int_x3 = 'b0;
    reg  [31:0]                   int_x4 = 'b0;
    reg  [31:0]                   int_x5 = 'b0;
    reg  [31:0]                   int_x6 = 'b0;
    reg  [31:0]                   int_x7 = 'b0;
    reg  [31:0]                   int_x8 = 'b0;
    reg  [31:0]                   int_x9 = 'b0;
    reg  [31:0]                   int_x10 = 'b0;
    reg  [31:0]                   int_x11 = 'b0;
    reg  [31:0]                   int_x12 = 'b0;
    reg  [31:0]                   int_x13 = 'b0;
    reg  [31:0]                   int_x14 = 'b0;
    reg  [31:0]                   int_x15 = 'b0;
    reg                           int_val_r_ap_vld;
    reg  [31:0]                   int_val_r = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_X0_DATA_0: begin
                    rdata <= int_x0[31:0];
                end
                ADDR_X1_DATA_0: begin
                    rdata <= int_x1[31:0];
                end
                ADDR_X2_DATA_0: begin
                    rdata <= int_x2[31:0];
                end
                ADDR_X3_DATA_0: begin
                    rdata <= int_x3[31:0];
                end
                ADDR_X4_DATA_0: begin
                    rdata <= int_x4[31:0];
                end
                ADDR_X5_DATA_0: begin
                    rdata <= int_x5[31:0];
                end
                ADDR_X6_DATA_0: begin
                    rdata <= int_x6[31:0];
                end
                ADDR_X7_DATA_0: begin
                    rdata <= int_x7[31:0];
                end
                ADDR_X8_DATA_0: begin
                    rdata <= int_x8[31:0];
                end
                ADDR_X9_DATA_0: begin
                    rdata <= int_x9[31:0];
                end
                ADDR_X10_DATA_0: begin
                    rdata <= int_x10[31:0];
                end
                ADDR_X11_DATA_0: begin
                    rdata <= int_x11[31:0];
                end
                ADDR_X12_DATA_0: begin
                    rdata <= int_x12[31:0];
                end
                ADDR_X13_DATA_0: begin
                    rdata <= int_x13[31:0];
                end
                ADDR_X14_DATA_0: begin
                    rdata <= int_x14[31:0];
                end
                ADDR_X15_DATA_0: begin
                    rdata <= int_x15[31:0];
                end
                ADDR_VAL_R_DATA_0: begin
                    rdata <= int_val_r[31:0];
                end
                ADDR_VAL_R_CTRL: begin
                    rdata[0] <= int_val_r_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign x0                = int_x0;
assign x1                = int_x1;
assign x2                = int_x2;
assign x3                = int_x3;
assign x4                = int_x4;
assign x5                = int_x5;
assign x6                = int_x6;
assign x7                = int_x7;
assign x8                = int_x8;
assign x9                = int_x9;
assign x10               = int_x10;
assign x11               = int_x11;
assign x12               = int_x12;
assign x13               = int_x13;
assign x14               = int_x14;
assign x15               = int_x15;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_done & int_auto_restart)
            int_ap_start <= 1'b1; // auto restart
        else
            int_ap_start <= 1'b0; // self clear
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[0];
    end
end

// int_isr
always @(posedge ACLK) begin
    if (ARESET)
        int_isr <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier & ap_done)
            int_isr <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr <= int_isr ^ WDATA[0]; // toggle on write
    end
end

// int_x0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X0_DATA_0)
            int_x0[31:0] <= (WDATA[31:0] & wmask) | (int_x0[31:0] & ~wmask);
    end
end

// int_x1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X1_DATA_0)
            int_x1[31:0] <= (WDATA[31:0] & wmask) | (int_x1[31:0] & ~wmask);
    end
end

// int_x2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X2_DATA_0)
            int_x2[31:0] <= (WDATA[31:0] & wmask) | (int_x2[31:0] & ~wmask);
    end
end

// int_x3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X3_DATA_0)
            int_x3[31:0] <= (WDATA[31:0] & wmask) | (int_x3[31:0] & ~wmask);
    end
end

// int_x4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X4_DATA_0)
            int_x4[31:0] <= (WDATA[31:0] & wmask) | (int_x4[31:0] & ~wmask);
    end
end

// int_x5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X5_DATA_0)
            int_x5[31:0] <= (WDATA[31:0] & wmask) | (int_x5[31:0] & ~wmask);
    end
end

// int_x6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X6_DATA_0)
            int_x6[31:0] <= (WDATA[31:0] & wmask) | (int_x6[31:0] & ~wmask);
    end
end

// int_x7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X7_DATA_0)
            int_x7[31:0] <= (WDATA[31:0] & wmask) | (int_x7[31:0] & ~wmask);
    end
end

// int_x8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X8_DATA_0)
            int_x8[31:0] <= (WDATA[31:0] & wmask) | (int_x8[31:0] & ~wmask);
    end
end

// int_x9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X9_DATA_0)
            int_x9[31:0] <= (WDATA[31:0] & wmask) | (int_x9[31:0] & ~wmask);
    end
end

// int_x10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X10_DATA_0)
            int_x10[31:0] <= (WDATA[31:0] & wmask) | (int_x10[31:0] & ~wmask);
    end
end

// int_x11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X11_DATA_0)
            int_x11[31:0] <= (WDATA[31:0] & wmask) | (int_x11[31:0] & ~wmask);
    end
end

// int_x12[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x12[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X12_DATA_0)
            int_x12[31:0] <= (WDATA[31:0] & wmask) | (int_x12[31:0] & ~wmask);
    end
end

// int_x13[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x13[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X13_DATA_0)
            int_x13[31:0] <= (WDATA[31:0] & wmask) | (int_x13[31:0] & ~wmask);
    end
end

// int_x14[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x14[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X14_DATA_0)
            int_x14[31:0] <= (WDATA[31:0] & wmask) | (int_x14[31:0] & ~wmask);
    end
end

// int_x15[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x15[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X15_DATA_0)
            int_x15[31:0] <= (WDATA[31:0] & wmask) | (int_x15[31:0] & ~wmask);
    end
end

// int_val_r
always @(posedge ACLK) begin
    if (ARESET)
        int_val_r <= 0;
    else if (ACLK_EN) begin
        if (val_r_ap_vld)
            int_val_r <= val_r;
    end
end

// int_val_r_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_val_r_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (val_r_ap_vld)
            int_val_r_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_VAL_R_CTRL)
            int_val_r_ap_vld <= 1'b0; // clear on read
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr & int_ier & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule

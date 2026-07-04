// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __unsw_linear_transformer_mul_mul_20s_13s_33_4_1__HH__
#define __unsw_linear_transformer_mul_mul_20s_13s_33_4_1__HH__
#include "unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(unsw_linear_transformer_mul_mul_20s_13s_33_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8 unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U;

    SC_CTOR(unsw_linear_transformer_mul_mul_20s_13s_33_4_1):  unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U ("unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U") {
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.clk(clk);
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.rst(reset);
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.ce(ce);
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.a(din0);
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.b(din1);
        unsw_linear_transformer_mul_mul_20s_13s_33_4_1_DSP48_8_U.p(dout);

    }

};

#endif //

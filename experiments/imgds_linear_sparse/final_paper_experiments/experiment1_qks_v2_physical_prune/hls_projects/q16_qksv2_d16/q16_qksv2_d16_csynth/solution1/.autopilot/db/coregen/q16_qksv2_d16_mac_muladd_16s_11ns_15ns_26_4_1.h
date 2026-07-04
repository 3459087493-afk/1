// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1__HH__
#define __q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1__HH__
#include "q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15 q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U;

    SC_CTOR(q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1):  q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U ("q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U") {
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.clk(clk);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.rst(reset);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.ce(ce);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.in0(din0);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.in1(din1);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.in2(din2);
        q16_qksv2_d16_mac_muladd_16s_11ns_15ns_26_4_1_DSP48_15_U.dout(dout);

    }

};

#endif //

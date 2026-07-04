set SynModuleInfo {
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mul_mul_9s_16s_25_4_1 RTLNAME imgds_linear_small_b_mul_mul_9s_16s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_input_projection_weight_V_ROM_bkb RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_input_projection_weight_V_ROM_bkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_flow_control_loop_pipe_sequential_init RTLNAME imgds_linear_small_b_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME imgds_linear_small_b_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_48_3 MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_48_3 RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mul_mul_12s_16s_28_4_1 RTLNAME imgds_linear_small_b_mul_mul_12s_16s_28_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mul_mul_11s_16s_27_4_1 RTLNAME imgds_linear_small_b_mul_mul_11s_16s_27_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_wecud RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_wecud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weigdEe RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weigdEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_value_weeOg RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_value_weeOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_ MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_16s_30ns_30_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_16s_30ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_78_8 MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_78_8 RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_78_8}
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_88_10 MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_88_10 RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_88_10}
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12 MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12 RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mul_mul_24s_16s_30_4_1 RTLNAME imgds_linear_small_b_mul_mul_24s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_small_b_Pipeline_VITIS_LOOP_107_14 MODELNAME linear_attention_small_b_Pipeline_VITIS_LOOP_107_14 RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_layers_0_attention_outputfYi RTLNAME imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_layers_0_attention_outputfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_small_b MODELNAME linear_attention_small_b RTLNAME imgds_linear_small_b_linear_attention_small_b
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_fpext_32ns_64_2_no_dsp_1 RTLNAME imgds_linear_small_b_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME imgds_linear_small_b_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_layers_0_attention_output_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_linear_attention_small_b_layers_0_attention_output_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_Q_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_linear_attention_small_b_Q_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_KV_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_linear_attention_small_b_KV_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_linear_attention_small_b_K_sum_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_linear_attention_small_b_K_sum_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_small_b.1 MODELNAME layer_norm_small_b_1 RTLNAME imgds_linear_small_b_layer_norm_small_b_1
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME imgds_linear_small_b_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_small_b_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mul_mul_16s_16s_30_4_1 RTLNAME imgds_linear_small_b_mul_mul_16s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_am_submul_16s_16s_16s_26_4_1 RTLNAME imgds_linear_small_b_am_submul_16s_16s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_11ns_17ns_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_11ns_17ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_11ns_18s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_11ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_11ns_17s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_11ns_17s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_10ns_17ns_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_10ns_17ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_10ns_17s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_10ns_17s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4}
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_layers_0_feedforward_0_weight_g8j RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_layers_0_feedforward_0_weight_g8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mul_mul_11s_15ns_26_4_1 RTLNAME imgds_linear_small_b_mul_mul_11s_15ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_layers_0_feedforward_3_weight_hbi RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_layers_0_feedforward_3_weight_hbi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6}
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5}
  {SRCNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7 MODELNAME imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7 RTLNAME imgds_linear_small_b_imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7}
  {SRCNAME layer_norm_small_b_Pipeline_VITIS_LOOP_19_1 MODELNAME layer_norm_small_b_Pipeline_VITIS_LOOP_19_1 RTLNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_19_1}
  {SRCNAME layer_norm_small_b_Pipeline_VITIS_LOOP_22_2 MODELNAME layer_norm_small_b_Pipeline_VITIS_LOOP_22_2 RTLNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_22_2}
  {SRCNAME layer_norm_small_b_Pipeline_VITIS_LOOP_27_3 MODELNAME layer_norm_small_b_Pipeline_VITIS_LOOP_27_3 RTLNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_11ns_19s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_11ns_19s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_output_norm_weight_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_output_norm_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_output_norm_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_output_norm_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_small_b MODELNAME layer_norm_small_b RTLNAME imgds_linear_small_b_layer_norm_small_b}
  {SRCNAME imgds_linear_small_b MODELNAME imgds_linear_small_b RTLNAME imgds_linear_small_b IS_TOP 1
    SUBMODULES {
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_10s_20s_25_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_10s_20s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_8ns_19s_24_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_8ns_19s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_10s_25s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_10s_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_8s_24s_25_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_8s_24s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_9ns_26ns_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_9ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_11s_26ns_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_11s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_8ns_26s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_8ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_9s_26s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_9s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_6ns_26s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_6ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_mac_muladd_16s_8s_26s_26_4_1 RTLNAME imgds_linear_small_b_mac_muladd_16s_8s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_small_b_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_input_projection_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_input_projection_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_position_embedding_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_position_embedding_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_layers_0_feedforward_0_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_layers_0_feedforward_0_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_layers_0_feedforward_3_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_small_b_layers_0_feedforward_3_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_hidden_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_hidden_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_x_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_x_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_pooled_V_RAM_AUTO_1R1W RTLNAME imgds_linear_small_b_pooled_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_small_b_gmem0_m_axi RTLNAME imgds_linear_small_b_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_small_b_gmem1_m_axi RTLNAME imgds_linear_small_b_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_small_b_control_s_axi RTLNAME imgds_linear_small_b_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

set SynModuleInfo {
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_234_3 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_234_3 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_234_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_3s_24s_24_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_3s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_234_3_input_projection_weight_V_ROMbkb RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_234_3_input_projection_weight_V_ROMbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_flow_control_loop_pipe_sequential_init RTLNAME imgds_linear_dense_q8_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME imgds_linear_dense_q8_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_97_3 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_97_3 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_6s_24s_24_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_6s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_5s_24s_24_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_5s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_4s_24s_24_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_4s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_query_weight_cud RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_query_weight_cud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_key_weight_V_dEe RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_key_weight_V_dEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_value_weight_eOg RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_97_3_layers_0_attention_value_weight_eOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_16s_30ns_30_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_16s_30ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_127_8 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_127_8 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_127_8}
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_138_10 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_138_10 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_138_10}
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_mul_mul_24s_16s_30_4_1 RTLNAME imgds_linear_dense_q8_mul_mul_24s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q8_Pipeline_VITIS_LOOP_159_14 MODELNAME linear_attention_q8_Pipeline_VITIS_LOOP_159_14 RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_159_14
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_159_14_layers_0_attention_output_weigfYi RTLNAME imgds_linear_dense_q8_linear_attention_q8_Pipeline_VITIS_LOOP_159_14_layers_0_attention_output_weigfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q8 MODELNAME linear_attention_q8 RTLNAME imgds_linear_dense_q8_linear_attention_q8
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_fpext_32ns_64_2_no_dsp_1 RTLNAME imgds_linear_dense_q8_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME imgds_linear_dense_q8_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_layers_0_attention_output_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_linear_attention_q8_layers_0_attention_output_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_Q_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q8_linear_attention_q8_Q_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_linear_attention_q8_K_sum_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q8_linear_attention_q8_K_sum_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q8.1 MODELNAME layer_norm_q8_1 RTLNAME imgds_linear_dense_q8_layer_norm_q8_1
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME imgds_linear_dense_q8_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_dense_q8_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mul_mul_16s_16s_30_4_1 RTLNAME imgds_linear_dense_q8_mul_mul_16s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_am_submul_16s_16s_16s_26_4_1 RTLNAME imgds_linear_dense_q8_am_submul_16s_16s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_11ns_20_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_11ns_20_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mul_mul_16s_5ns_20_4_1 RTLNAME imgds_linear_dense_q8_mul_mul_16s_5ns_20_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_11s_20_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_11s_20_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_12s_20_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_16s_5ns_12s_20_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_254_4 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_254_4 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_254_4}
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_185_3 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_185_3 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_185_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_185_3_layers_0_feedforward_0_weightg8j RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_185_3_layers_0_feedforward_0_weightg8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_197_5 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_197_5 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_197_5
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_mac_muladd_15ns_5s_24s_24_4_1 RTLNAME imgds_linear_dense_q8_mac_muladd_15ns_5s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_197_5_layers_0_feedforward_3_weighthbi RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_197_5_layers_0_feedforward_3_weighthbi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_205_6 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_205_6 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_205_6}
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_267_5 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_267_5 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_267_5}
  {SRCNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_272_6_VITIS_LOOP_274_7 MODELNAME imgds_linear_dense_q8_Pipeline_VITIS_LOOP_272_6_VITIS_LOOP_274_7 RTLNAME imgds_linear_dense_q8_imgds_linear_dense_q8_Pipeline_VITIS_LOOP_272_6_VITIS_LOOP_274_7}
  {SRCNAME layer_norm_q8_Pipeline_VITIS_LOOP_46_1 MODELNAME layer_norm_q8_Pipeline_VITIS_LOOP_46_1 RTLNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_46_1}
  {SRCNAME layer_norm_q8_Pipeline_VITIS_LOOP_52_2 MODELNAME layer_norm_q8_Pipeline_VITIS_LOOP_52_2 RTLNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_52_2}
  {SRCNAME layer_norm_q8_Pipeline_VITIS_LOOP_64_3 MODELNAME layer_norm_q8_Pipeline_VITIS_LOOP_64_3 RTLNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_64_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_64_3_output_norm_weight_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_64_3_output_norm_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_64_3_output_norm_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_layer_norm_q8_Pipeline_VITIS_LOOP_64_3_output_norm_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q8 MODELNAME layer_norm_q8 RTLNAME imgds_linear_dense_q8_layer_norm_q8}
  {SRCNAME imgds_linear_dense_q8 MODELNAME imgds_linear_dense_q8 RTLNAME imgds_linear_dense_q8 IS_TOP 1
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q8_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_dense_q8_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_input_projection_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_input_projection_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_position_embedding_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_position_embedding_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_layers_0_feedforward_0_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_layers_0_feedforward_0_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_layers_0_feedforward_3_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q8_layers_0_feedforward_3_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_hidden_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q8_hidden_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_x_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q8_x_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_pooled_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q8_pooled_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q8_gmem0_m_axi RTLNAME imgds_linear_dense_q8_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_dense_q8_gmem1_m_axi RTLNAME imgds_linear_dense_q8_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_dense_q8_control_s_axi RTLNAME imgds_linear_dense_q8_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

set SynModuleInfo {
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mul_mul_9s_16s_25_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_9s_16s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_input_projection_weight_V_RObkb RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_input_projection_weight_V_RObkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_flow_control_loop_pipe_sequential_init RTLNAME imgds_linear_dense_q16_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME imgds_linear_dense_q16_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mul_mul_10s_16s_26_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_10s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_layers_cud RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_layers_cud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mul_mul_12s_16s_28_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_12s_16s_28_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mul_mul_11s_16s_27_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_11s_16s_27_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_layers_0_attention_querdEe RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_layers_0_attention_querdEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_layers_0_attention_key_eOg RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_layers_0_attention_key_eOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_16s_30ns_30_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_16s_30ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10}
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12}
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mul_mul_24s_16s_30_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_24s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16 MODELNAME linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16 RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_layers_0_attention_outfYi RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_layers_0_attention_outfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME linear_attention_q16_sparse MODELNAME linear_attention_q16_sparse RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_fpext_32ns_64_2_no_dsp_1 RTLNAME imgds_linear_dense_q16_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME imgds_linear_dense_q16_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_ACTIVE_CHANNELS_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_ACTIVE_CHANNELS_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_layers_0_attention_output_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_layers_0_attention_output_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Q_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_Q_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_linear_attention_q16_sparse_K_sum_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q16_linear_attention_q16_sparse_K_sum_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q16.1 MODELNAME layer_norm_q16_1 RTLNAME imgds_linear_dense_q16_layer_norm_q16_1
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME imgds_linear_dense_q16_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_dense_q16_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mul_mul_16s_16s_30_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_16s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_am_submul_16s_16s_16s_26_4_1 RTLNAME imgds_linear_dense_q16_am_submul_16s_16s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_16s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_16ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_17s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_17s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_15s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_15s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_16s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_16ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_18s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_15ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_15ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_18s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_11ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4}
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_layers_0_feedforward_0_weighg8j RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_layers_0_feedforward_0_weighg8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mul_mul_10s_15ns_25_4_1 RTLNAME imgds_linear_dense_q16_mul_mul_10s_15ns_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_layers_0_feedforward_3_weighhbi RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_layers_0_feedforward_3_weighhbi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6}
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5}
  {SRCNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7 MODELNAME imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7 RTLNAME imgds_linear_dense_q16_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7}
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_47_1 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_47_1 RTLNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_47_1}
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_53_2 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_53_2 RTLNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_53_2}
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_65_3 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_65_3 RTLNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_65_3
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_output_norm_weight_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_output_norm_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_output_norm_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_output_norm_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q16 MODELNAME layer_norm_q16 RTLNAME imgds_linear_dense_q16_layer_norm_q16}
  {SRCNAME imgds_linear_dense_q16 MODELNAME imgds_linear_dense_q16 RTLNAME imgds_linear_dense_q16 IS_TOP 1
    SUBMODULES {
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_9s_19s_24_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_9s_19s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_9ns_18s_25_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_9ns_18s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_7ns_24s_25_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_7ns_24s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_8ns_25s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_8ns_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10s_25s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10s_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_8ns_26s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_8ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_9ns_26ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_9ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_9s_26s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_9s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10s_26ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_7ns_26s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_7ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_26ns_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_10ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_mac_muladd_16s_8s_26s_26_4_1 RTLNAME imgds_linear_dense_q16_mac_muladd_16s_8s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME imgds_linear_dense_q16_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_input_projection_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_input_projection_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_position_embedding_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_position_embedding_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_layers_0_feedforward_0_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_layers_0_feedforward_0_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_layers_0_feedforward_3_bias_V_ROM_AUTO_1R RTLNAME imgds_linear_dense_q16_layers_0_feedforward_3_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_hidden_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q16_hidden_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_x_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q16_x_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_pooled_V_RAM_AUTO_1R1W RTLNAME imgds_linear_dense_q16_pooled_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME imgds_linear_dense_q16_gmem0_m_axi RTLNAME imgds_linear_dense_q16_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_dense_q16_gmem1_m_axi RTLNAME imgds_linear_dense_q16_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME imgds_linear_dense_q16_control_s_axi RTLNAME imgds_linear_dense_q16_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

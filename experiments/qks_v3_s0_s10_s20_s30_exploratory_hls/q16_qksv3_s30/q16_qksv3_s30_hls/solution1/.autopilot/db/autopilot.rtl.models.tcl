set SynModuleInfo {
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_222_3 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_222_3 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_222_3
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_9s_16s_25_4_1 RTLNAME q16_qksv3_s30_mul_mul_9s_16s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_222_3_input_projection_weight_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_222_3_input_projection_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_flow_control_loop_pipe_sequential_init RTLNAME q16_qksv3_s30_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME q16_qksv3_s30_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_10s_16s_26_4_1 RTLNAME q16_qksv3_s30_mul_mul_10s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3_layers_0_attentibkb RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3_layers_0_attentibkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_87_5 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_87_5 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_87_5
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_12s_16s_28_4_1 RTLNAME q16_qksv3_s30_mul_mul_12s_16s_28_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_87_5_layers_0_attention_query_weight_cud RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_87_5_layers_0_attention_query_weight_cud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_97_7 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_97_7 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_97_7
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_11s_16s_27_4_1 RTLNAME q16_qksv3_s30_mul_mul_11s_16s_27_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_97_7_layers_0_attention_key_weight_V_dEe RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_97_7_layers_0_attention_key_weight_V_dEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_107_8_VITIS_LOOP_108_9_VITIS_LOOP_110_10 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_107_8_VITIS_LOOP_108_9_VITIS_LOOP_110_10 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_107_8_VITIS_LOOP_108_9_VITIS_LOOP_110_10
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mac_muladd_4ns_4ns_4ns_7_4_1 RTLNAME q16_qksv3_s30_mac_muladd_4ns_4ns_4ns_7_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_16s_30ns_30_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_16s_30ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_122_12 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_122_12 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_122_12}
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_133_14 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_133_14 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_133_14}
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_141_15_VITIS_LOOP_143_16 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_141_15_VITIS_LOOP_143_16 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_141_15_VITIS_LOOP_143_16
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_24s_16s_30_4_1 RTLNAME q16_qksv3_s30_mul_mul_24s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned_Pipeline_VITIS_LOOP_153_18 MODELNAME attention_v2_pruned_Pipeline_VITIS_LOOP_153_18 RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_153_18
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_153_18_layers_0_attention_output_weigeOg RTLNAME q16_qksv3_s30_attention_v2_pruned_Pipeline_VITIS_LOOP_153_18_layers_0_attention_output_weigeOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_v2_pruned MODELNAME attention_v2_pruned RTLNAME q16_qksv3_s30_attention_v2_pruned
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME q16_qksv3_s30_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_layers_0_attention_output_bias_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_attention_v2_pruned_layers_0_attention_output_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_Q_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_attention_v2_pruned_Q_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_V_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_attention_v2_pruned_V_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_K_sum_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_attention_v2_pruned_K_sum_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_attention_v2_pruned_attended_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_attention_v2_pruned_attended_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm.1 MODELNAME layer_norm_1 RTLNAME q16_qksv3_s30_layer_norm_1
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME q16_qksv3_s30_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME q16_qksv3_s30_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mul_mul_16s_16s_30_4_1 RTLNAME q16_qksv3_s30_mul_mul_16s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_am_submul_16s_16s_16s_26_4_1 RTLNAME q16_qksv3_s30_am_submul_16s_16s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_16s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_16ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_17s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_17s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_15s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_15s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10ns_16s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10ns_16ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10ns_18s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_15ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_15ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_11ns_18s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_11ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_243_4 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_243_4 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_243_4}
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_178_3 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_178_3 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_178_3
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_178_3_layers_0_feedforward_0_weight_V_ROM_AfYi RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_178_3_layers_0_feedforward_0_weight_V_ROM_AfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_189_5 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_189_5 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_189_5
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_mul_10s_15ns_25_4_1 RTLNAME q16_qksv3_s30_mul_mul_10s_15ns_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_189_5_layers_0_feedforward_3_weight_V_ROM_Ag8j RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_189_5_layers_0_feedforward_3_weight_V_ROM_Ag8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_196_6 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_196_6 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_196_6}
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_256_5 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_256_5 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_256_5}
  {SRCNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_261_6_VITIS_LOOP_263_7 MODELNAME q16_qksv3_s30_Pipeline_VITIS_LOOP_261_6_VITIS_LOOP_263_7 RTLNAME q16_qksv3_s30_q16_qksv3_s30_Pipeline_VITIS_LOOP_261_6_VITIS_LOOP_263_7
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mul_34s_36ns_69_2_1 RTLNAME q16_qksv3_s30_mul_34s_36ns_69_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_Pipeline_VITIS_LOOP_36_1 MODELNAME layer_norm_Pipeline_VITIS_LOOP_36_1 RTLNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_36_1}
  {SRCNAME layer_norm_Pipeline_VITIS_LOOP_40_2 MODELNAME layer_norm_Pipeline_VITIS_LOOP_40_2 RTLNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_40_2}
  {SRCNAME layer_norm_Pipeline_VITIS_LOOP_47_3 MODELNAME layer_norm_Pipeline_VITIS_LOOP_47_3 RTLNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_weight_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_bias_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm MODELNAME layer_norm RTLNAME q16_qksv3_s30_layer_norm}
  {SRCNAME q16_qksv3_s30 MODELNAME q16_qksv3_s30 RTLNAME q16_qksv3_s30 IS_TOP 1
    SUBMODULES {
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_9s_19s_24_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_9s_19s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_9ns_18s_25_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_9ns_18s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10s_25s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10s_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_8ns_25s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_8ns_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_8ns_26s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_8ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_9ns_26ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_9ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_9s_26s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_9s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10s_26ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_7ns_26s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_7ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_10ns_26ns_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_10ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_mac_muladd_16s_8s_26s_26_4_1 RTLNAME q16_qksv3_s30_mac_muladd_16s_8s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME q16_qksv3_s30_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_fpext_32ns_64_2_no_dsp_1 RTLNAME q16_qksv3_s30_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_input_projection_bias_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_input_projection_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_position_embedding_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_position_embedding_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_layers_0_feedforward_0_bias_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_layers_0_feedforward_0_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_layers_0_feedforward_3_bias_V_ROM_AUTO_1R RTLNAME q16_qksv3_s30_layers_0_feedforward_3_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_hidden_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_hidden_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_ff_out_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_ff_out_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_x_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_x_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_pooled_V_RAM_AUTO_1R1W RTLNAME q16_qksv3_s30_pooled_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_qksv3_s30_gmem0_m_axi RTLNAME q16_qksv3_s30_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_qksv3_s30_gmem2_m_axi RTLNAME q16_qksv3_s30_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_qksv3_s30_gmem1_m_axi RTLNAME q16_qksv3_s30_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_qksv3_s30_control_s_axi RTLNAME q16_qksv3_s30_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

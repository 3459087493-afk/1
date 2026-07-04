set SynModuleInfo {
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_204_3 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_204_3 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_204_3
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_mul_9s_16s_25_4_1 RTLNAME q16_esla_k13_mul_mul_9s_16s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_204_3_input_projection_weight_V_ROM_AUTO_1R RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_204_3_input_projection_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_flow_control_loop_pipe_sequential_init RTLNAME q16_esla_k13_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME q16_esla_k13_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_221_6 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_221_6 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_221_6
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_mul_11s_16s_27_4_1 RTLNAME q16_esla_k13_mul_mul_11s_16s_27_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_221_6_layers_0_attention_key_weight_V_ROM_AUbkb RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_221_6_layers_0_attention_key_weight_V_ROM_AUbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_43_1 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_43_1 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_43_1}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_52_3 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_52_3 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_52_3}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_63_4 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_63_4 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_63_4}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_70_6 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_70_6 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_70_6}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_241_7 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_241_7 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_241_7}
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_91_3 MODELNAME attention_active13_Pipeline_VITIS_LOOP_91_3 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_91_3
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_mul_12s_16s_28_4_1 RTLNAME q16_esla_k13_mul_mul_12s_16s_28_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mul_mul_10s_16s_26_4_1 RTLNAME q16_esla_k13_mul_mul_10s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_91_3_layers_0_attention_query_weight_Vcud RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_91_3_layers_0_attention_query_weight_Vcud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_91_3_layers_0_attention_value_weight_VdEe RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_91_3_layers_0_attention_value_weight_VdEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6 MODELNAME attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6
    SUBMODULES {
      {MODELNAME q16_esla_k13_mac_muladd_16s_16s_30ns_30_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_16s_30ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_117_8 MODELNAME attention_active13_Pipeline_VITIS_LOOP_117_8 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_117_8}
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_126_10 MODELNAME attention_active13_Pipeline_VITIS_LOOP_126_10 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_126_10}
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12 MODELNAME attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_mul_24s_16s_30_4_1 RTLNAME q16_esla_k13_mul_mul_24s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_active13_Pipeline_VITIS_LOOP_144_14 MODELNAME attention_active13_Pipeline_VITIS_LOOP_144_14 RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_144_14
    SUBMODULES {
      {MODELNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_144_14_layers_0_attention_output_weigheOg RTLNAME q16_esla_k13_attention_active13_Pipeline_VITIS_LOOP_144_14_layers_0_attention_output_weigheOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME attention_active13 MODELNAME attention_active13 RTLNAME q16_esla_k13_attention_active13
    SUBMODULES {
      {MODELNAME q16_esla_k13_attention_active13_layers_0_attention_output_bias_V_ROM_AUTO_1R RTLNAME q16_esla_k13_attention_active13_layers_0_attention_output_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_attention_active13_Q_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_attention_active13_Q_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_attention_active13_KV_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_attention_active13_KV_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_attention_active13_K_sum_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_attention_active13_K_sum_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q16.1 MODELNAME layer_norm_q16_1 RTLNAME q16_esla_k13_layer_norm_q16_1
    SUBMODULES {
      {MODELNAME q16_esla_k13_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME q16_esla_k13_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME q16_esla_k13_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mul_mul_16s_16s_30_4_1 RTLNAME q16_esla_k13_mul_mul_16s_16s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_am_submul_16s_16s_16s_26_4_1 RTLNAME q16_esla_k13_am_submul_16s_16s_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_16s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_16ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_17s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_17s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_15s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_15s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10ns_16s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10ns_16s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10ns_16ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10ns_16ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10ns_18s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_15ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_15ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_11ns_18s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_11ns_18s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_251_9 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_251_9 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_251_9}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_162_3 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_162_3 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_162_3
    SUBMODULES {
      {MODELNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_162_3_layers_0_feedforward_0_weight_V_ROM_AUfYi RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_162_3_layers_0_feedforward_0_weight_V_ROM_AUfYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_174_5 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_174_5 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_174_5
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_mul_10s_15ns_25_4_1 RTLNAME q16_esla_k13_mul_mul_10s_15ns_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_174_5_layers_0_feedforward_3_weight_V_ROM_AUg8j RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_174_5_layers_0_feedforward_3_weight_V_ROM_AUg8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_181_6 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_181_6 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_181_6}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_258_10 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_258_10 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_258_10}
  {SRCNAME q16_esla_k13_Pipeline_VITIS_LOOP_265_11_VITIS_LOOP_267_12 MODELNAME q16_esla_k13_Pipeline_VITIS_LOOP_265_11_VITIS_LOOP_267_12 RTLNAME q16_esla_k13_q16_esla_k13_Pipeline_VITIS_LOOP_265_11_VITIS_LOOP_267_12
    SUBMODULES {
      {MODELNAME q16_esla_k13_mul_38s_40ns_77_2_1 RTLNAME q16_esla_k13_mul_38s_40ns_77_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_19_1 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_19_1 RTLNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_19_1}
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_23_2 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_23_2 RTLNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_23_2}
  {SRCNAME layer_norm_q16_Pipeline_VITIS_LOOP_29_3 MODELNAME layer_norm_q16_Pipeline_VITIS_LOOP_29_3 RTLNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_29_3
    SUBMODULES {
      {MODELNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_29_3_output_norm_weight_V_ROM_AUTO_1R RTLNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_29_3_output_norm_weight_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_29_3_output_norm_bias_V_ROM_AUTO_1R RTLNAME q16_esla_k13_layer_norm_q16_Pipeline_VITIS_LOOP_29_3_output_norm_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME layer_norm_q16 MODELNAME layer_norm_q16 RTLNAME q16_esla_k13_layer_norm_q16}
  {SRCNAME q16_esla_k13 MODELNAME q16_esla_k13 RTLNAME q16_esla_k13 IS_TOP 1
    SUBMODULES {
      {MODELNAME q16_esla_k13_fpext_32ns_64_2_no_dsp_1 RTLNAME q16_esla_k13_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME q16_esla_k13_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_9s_19s_24_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_9s_19s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_9ns_18s_25_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_9ns_18s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_7ns_24s_25_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_7ns_24s_25_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_8ns_25s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_8ns_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10s_25s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10s_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_8ns_26s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_8ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_9ns_26ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_9ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_9s_26s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_9s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10s_26ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_7ns_26s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_7ns_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_10ns_26ns_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_10ns_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_mac_muladd_16s_8s_26s_26_4_1 RTLNAME q16_esla_k13_mac_muladd_16s_8s_26s_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME q16_esla_k13_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_input_projection_bias_V_ROM_AUTO_1R RTLNAME q16_esla_k13_input_projection_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_position_embedding_V_ROM_AUTO_1R RTLNAME q16_esla_k13_position_embedding_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_layers_0_feedforward_0_bias_V_ROM_AUTO_1R RTLNAME q16_esla_k13_layers_0_feedforward_0_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_layers_0_feedforward_3_bias_V_ROM_AUTO_1R RTLNAME q16_esla_k13_layers_0_feedforward_3_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_hidden_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_hidden_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_sorted_score_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_sorted_score_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_sorted_index_RAM_1WNR_AUTO_1R1W RTLNAME q16_esla_k13_sorted_index_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_x_full_V_RAM_1WNR_AUTO_1R1W RTLNAME q16_esla_k13_x_full_V_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_x_active_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_x_active_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_phi_k_active_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_phi_k_active_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_pooled_V_RAM_AUTO_1R1W RTLNAME q16_esla_k13_pooled_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME q16_esla_k13_gmem0_m_axi RTLNAME q16_esla_k13_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_esla_k13_gmem1_m_axi RTLNAME q16_esla_k13_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_esla_k13_gmem2_m_axi RTLNAME q16_esla_k13_gmem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME q16_esla_k13_control_s_axi RTLNAME q16_esla_k13_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 201 \
    name normalizer \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename normalizer \
    op interface \
    ports { normalizer_address0 { O 3 vector } normalizer_ce0 { O 1 bit } normalizer_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'normalizer'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 202 \
    name query \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename query \
    op interface \
    ports { query_address0 { O 6 vector } query_ce0 { O 1 bit } query_q0 { I 32 vector } query_address1 { O 6 vector } query_ce1 { O 1 bit } query_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'query'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 211 \
    name values_new \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename values_new \
    op interface \
    ports { values_new_address0 { O 6 vector } values_new_ce0 { O 1 bit } values_new_we0 { O 1 bit } values_new_d0 { O 32 vector } values_new_address1 { O 6 vector } values_new_ce1 { O 1 bit } values_new_we1 { O 1 bit } values_new_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'values_new'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name kv_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load \
    op interface \
    ports { kv_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name kv_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_1 \
    op interface \
    ports { kv_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name kv_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_2 \
    op interface \
    ports { kv_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name kv_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_3 \
    op interface \
    ports { kv_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name kv_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_4 \
    op interface \
    ports { kv_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name kv_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_5 \
    op interface \
    ports { kv_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name kv_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_6 \
    op interface \
    ports { kv_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name kv_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_7 \
    op interface \
    ports { kv_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name kv_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_8 \
    op interface \
    ports { kv_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name kv_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_9 \
    op interface \
    ports { kv_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name kv_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_10 \
    op interface \
    ports { kv_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name kv_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_11 \
    op interface \
    ports { kv_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name kv_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_12 \
    op interface \
    ports { kv_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name kv_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_13 \
    op interface \
    ports { kv_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name kv_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_14 \
    op interface \
    ports { kv_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name kv_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_15 \
    op interface \
    ports { kv_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name kv_load_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_16 \
    op interface \
    ports { kv_load_16 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name kv_load_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_17 \
    op interface \
    ports { kv_load_17 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name kv_load_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_18 \
    op interface \
    ports { kv_load_18 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name kv_load_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_19 \
    op interface \
    ports { kv_load_19 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name kv_load_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_20 \
    op interface \
    ports { kv_load_20 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name kv_load_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_21 \
    op interface \
    ports { kv_load_21 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name kv_load_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_22 \
    op interface \
    ports { kv_load_22 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name kv_load_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_23 \
    op interface \
    ports { kv_load_23 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name kv_load_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_24 \
    op interface \
    ports { kv_load_24 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name kv_load_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_25 \
    op interface \
    ports { kv_load_25 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name kv_load_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_26 \
    op interface \
    ports { kv_load_26 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name kv_load_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_27 \
    op interface \
    ports { kv_load_27 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name kv_load_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_28 \
    op interface \
    ports { kv_load_28 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name kv_load_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_29 \
    op interface \
    ports { kv_load_29 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name kv_load_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_30 \
    op interface \
    ports { kv_load_30 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name kv_load_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_31 \
    op interface \
    ports { kv_load_31 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name kv_load_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_32 \
    op interface \
    ports { kv_load_32 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name kv_load_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_33 \
    op interface \
    ports { kv_load_33 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name kv_load_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_34 \
    op interface \
    ports { kv_load_34 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name kv_load_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_35 \
    op interface \
    ports { kv_load_35 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name kv_load_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_36 \
    op interface \
    ports { kv_load_36 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name kv_load_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_37 \
    op interface \
    ports { kv_load_37 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name kv_load_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_38 \
    op interface \
    ports { kv_load_38 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name kv_load_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_39 \
    op interface \
    ports { kv_load_39 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name kv_load_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_40 \
    op interface \
    ports { kv_load_40 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name kv_load_41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_41 \
    op interface \
    ports { kv_load_41 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name kv_load_42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_42 \
    op interface \
    ports { kv_load_42 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 247 \
    name kv_load_43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_43 \
    op interface \
    ports { kv_load_43 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name kv_load_44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_44 \
    op interface \
    ports { kv_load_44 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 249 \
    name kv_load_45 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_45 \
    op interface \
    ports { kv_load_45 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name kv_load_46 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_46 \
    op interface \
    ports { kv_load_46 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name kv_load_47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_47 \
    op interface \
    ports { kv_load_47 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name kv_load_48 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_48 \
    op interface \
    ports { kv_load_48 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name kv_load_49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_49 \
    op interface \
    ports { kv_load_49 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name kv_load_50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_50 \
    op interface \
    ports { kv_load_50 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name kv_load_51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_51 \
    op interface \
    ports { kv_load_51 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name kv_load_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_52 \
    op interface \
    ports { kv_load_52 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 257 \
    name kv_load_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_53 \
    op interface \
    ports { kv_load_53 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 258 \
    name kv_load_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_54 \
    op interface \
    ports { kv_load_54 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 259 \
    name kv_load_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_55 \
    op interface \
    ports { kv_load_55 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 260 \
    name kv_load_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_56 \
    op interface \
    ports { kv_load_56 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 261 \
    name kv_load_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_57 \
    op interface \
    ports { kv_load_57 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 262 \
    name kv_load_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_58 \
    op interface \
    ports { kv_load_58 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 263 \
    name kv_load_59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_59 \
    op interface \
    ports { kv_load_59 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 264 \
    name kv_load_60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_60 \
    op interface \
    ports { kv_load_60 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name kv_load_61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_61 \
    op interface \
    ports { kv_load_61 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name kv_load_62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_62 \
    op interface \
    ports { kv_load_62 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name kv_load_63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kv_load_63 \
    op interface \
    ports { kv_load_63 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName transformer_flow_control_loop_pipe_sequential_init_U
set CompName transformer_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix transformer_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}



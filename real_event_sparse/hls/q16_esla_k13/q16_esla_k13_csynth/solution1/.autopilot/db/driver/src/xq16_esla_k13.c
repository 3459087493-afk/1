// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xq16_esla_k13.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XQ16_esla_k13_CfgInitialize(XQ16_esla_k13 *InstancePtr, XQ16_esla_k13_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XQ16_esla_k13_Start(XQ16_esla_k13 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL) & 0x80;
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XQ16_esla_k13_IsDone(XQ16_esla_k13 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XQ16_esla_k13_IsIdle(XQ16_esla_k13 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XQ16_esla_k13_IsReady(XQ16_esla_k13 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XQ16_esla_k13_EnableAutoRestart(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XQ16_esla_k13_DisableAutoRestart(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_AP_CTRL, 0);
}

void XQ16_esla_k13_Set_input_r(XQ16_esla_k13 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XQ16_esla_k13_Get_input_r(XQ16_esla_k13 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XQ16_esla_k13_Set_logits(XQ16_esla_k13 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_LOGITS_DATA, (u32)(Data));
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_LOGITS_DATA + 4, (u32)(Data >> 32));
}

u64 XQ16_esla_k13_Get_logits(XQ16_esla_k13 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_LOGITS_DATA);
    Data += (u64)XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_LOGITS_DATA + 4) << 32;
    return Data;
}

void XQ16_esla_k13_Set_active_token_indices(XQ16_esla_k13 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ACTIVE_TOKEN_INDICES_DATA, (u32)(Data));
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ACTIVE_TOKEN_INDICES_DATA + 4, (u32)(Data >> 32));
}

u64 XQ16_esla_k13_Get_active_token_indices(XQ16_esla_k13 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ACTIVE_TOKEN_INDICES_DATA);
    Data += (u64)XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ACTIVE_TOKEN_INDICES_DATA + 4) << 32;
    return Data;
}

void XQ16_esla_k13_InterruptGlobalEnable(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_GIE, 1);
}

void XQ16_esla_k13_InterruptGlobalDisable(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_GIE, 0);
}

void XQ16_esla_k13_InterruptEnable(XQ16_esla_k13 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_IER);
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_IER, Register | Mask);
}

void XQ16_esla_k13_InterruptDisable(XQ16_esla_k13 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_IER);
    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_IER, Register & (~Mask));
}

void XQ16_esla_k13_InterruptClear(XQ16_esla_k13 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQ16_esla_k13_WriteReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ISR, Mask);
}

u32 XQ16_esla_k13_InterruptGetEnabled(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_IER);
}

u32 XQ16_esla_k13_InterruptGetStatus(XQ16_esla_k13 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQ16_esla_k13_ReadReg(InstancePtr->Control_BaseAddress, XQ16_ESLA_K13_CONTROL_ADDR_ISR);
}


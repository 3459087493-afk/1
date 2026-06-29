// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtransformer.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTransformer_CfgInitialize(XTransformer *InstancePtr, XTransformer_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTransformer_Start(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTransformer_IsDone(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTransformer_IsIdle(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTransformer_IsReady(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTransformer_EnableAutoRestart(XTransformer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XTransformer_DisableAutoRestart(XTransformer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_AP_CTRL, 0);
}

void XTransformer_Set_input_array(XTransformer *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_INPUT_ARRAY_DATA, (u32)(Data));
    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_INPUT_ARRAY_DATA + 4, (u32)(Data >> 32));
}

u64 XTransformer_Get_input_array(XTransformer *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_INPUT_ARRAY_DATA);
    Data += (u64)XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_INPUT_ARRAY_DATA + 4) << 32;
    return Data;
}

void XTransformer_Set_val_r(XTransformer *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_DATA, (u32)(Data));
    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_DATA + 4, (u32)(Data >> 32));
}

u64 XTransformer_Get_val_r(XTransformer *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_DATA);
    Data += (u64)XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_DATA + 4) << 32;
    return Data;
}

void XTransformer_InterruptGlobalEnable(XTransformer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_GIE, 1);
}

void XTransformer_InterruptGlobalDisable(XTransformer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_GIE, 0);
}

void XTransformer_InterruptEnable(XTransformer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_IER);
    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_IER, Register | Mask);
}

void XTransformer_InterruptDisable(XTransformer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_IER);
    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_IER, Register & (~Mask));
}

void XTransformer_InterruptClear(XTransformer *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_ISR, Mask);
}

u32 XTransformer_InterruptGetEnabled(XTransformer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_IER);
}

u32 XTransformer_InterruptGetStatus(XTransformer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_ISR);
}


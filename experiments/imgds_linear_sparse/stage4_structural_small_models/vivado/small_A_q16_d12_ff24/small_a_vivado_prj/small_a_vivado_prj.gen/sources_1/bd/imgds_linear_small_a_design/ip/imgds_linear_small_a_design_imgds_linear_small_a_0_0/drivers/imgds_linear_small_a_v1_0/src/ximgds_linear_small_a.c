// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "ximgds_linear_small_a.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XImgds_linear_small_a_CfgInitialize(XImgds_linear_small_a *InstancePtr, XImgds_linear_small_a_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XImgds_linear_small_a_Start(XImgds_linear_small_a *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL) & 0x80;
    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XImgds_linear_small_a_IsDone(XImgds_linear_small_a *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XImgds_linear_small_a_IsIdle(XImgds_linear_small_a *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XImgds_linear_small_a_IsReady(XImgds_linear_small_a *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XImgds_linear_small_a_EnableAutoRestart(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XImgds_linear_small_a_DisableAutoRestart(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_AP_CTRL, 0);
}

void XImgds_linear_small_a_Set_input_r(XImgds_linear_small_a *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XImgds_linear_small_a_Get_input_r(XImgds_linear_small_a *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XImgds_linear_small_a_Set_logits(XImgds_linear_small_a *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_LOGITS_DATA, (u32)(Data));
    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_LOGITS_DATA + 4, (u32)(Data >> 32));
}

u64 XImgds_linear_small_a_Get_logits(XImgds_linear_small_a *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_LOGITS_DATA);
    Data += (u64)XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_LOGITS_DATA + 4) << 32;
    return Data;
}

void XImgds_linear_small_a_InterruptGlobalEnable(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_GIE, 1);
}

void XImgds_linear_small_a_InterruptGlobalDisable(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_GIE, 0);
}

void XImgds_linear_small_a_InterruptEnable(XImgds_linear_small_a *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_IER);
    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_IER, Register | Mask);
}

void XImgds_linear_small_a_InterruptDisable(XImgds_linear_small_a *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_IER);
    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_IER, Register & (~Mask));
}

void XImgds_linear_small_a_InterruptClear(XImgds_linear_small_a *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImgds_linear_small_a_WriteReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_ISR, Mask);
}

u32 XImgds_linear_small_a_InterruptGetEnabled(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_IER);
}

u32 XImgds_linear_small_a_InterruptGetStatus(XImgds_linear_small_a *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImgds_linear_small_a_ReadReg(InstancePtr->Control_BaseAddress, XIMGDS_LINEAR_SMALL_A_CONTROL_ADDR_ISR);
}


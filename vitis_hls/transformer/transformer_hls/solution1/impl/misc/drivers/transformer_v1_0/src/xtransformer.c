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

void XTransformer_Set_x0(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X0_DATA, Data);
}

u32 XTransformer_Get_x0(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X0_DATA);
    return Data;
}

void XTransformer_Set_x1(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X1_DATA, Data);
}

u32 XTransformer_Get_x1(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X1_DATA);
    return Data;
}

void XTransformer_Set_x2(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X2_DATA, Data);
}

u32 XTransformer_Get_x2(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X2_DATA);
    return Data;
}

void XTransformer_Set_x3(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X3_DATA, Data);
}

u32 XTransformer_Get_x3(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X3_DATA);
    return Data;
}

void XTransformer_Set_x4(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X4_DATA, Data);
}

u32 XTransformer_Get_x4(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X4_DATA);
    return Data;
}

void XTransformer_Set_x5(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X5_DATA, Data);
}

u32 XTransformer_Get_x5(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X5_DATA);
    return Data;
}

void XTransformer_Set_x6(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X6_DATA, Data);
}

u32 XTransformer_Get_x6(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X6_DATA);
    return Data;
}

void XTransformer_Set_x7(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X7_DATA, Data);
}

u32 XTransformer_Get_x7(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X7_DATA);
    return Data;
}

void XTransformer_Set_x8(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X8_DATA, Data);
}

u32 XTransformer_Get_x8(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X8_DATA);
    return Data;
}

void XTransformer_Set_x9(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X9_DATA, Data);
}

u32 XTransformer_Get_x9(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X9_DATA);
    return Data;
}

void XTransformer_Set_x10(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X10_DATA, Data);
}

u32 XTransformer_Get_x10(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X10_DATA);
    return Data;
}

void XTransformer_Set_x11(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X11_DATA, Data);
}

u32 XTransformer_Get_x11(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X11_DATA);
    return Data;
}

void XTransformer_Set_x12(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X12_DATA, Data);
}

u32 XTransformer_Get_x12(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X12_DATA);
    return Data;
}

void XTransformer_Set_x13(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X13_DATA, Data);
}

u32 XTransformer_Get_x13(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X13_DATA);
    return Data;
}

void XTransformer_Set_x14(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X14_DATA, Data);
}

u32 XTransformer_Get_x14(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X14_DATA);
    return Data;
}

void XTransformer_Set_x15(XTransformer *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTransformer_WriteReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X15_DATA, Data);
}

u32 XTransformer_Get_x15(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_X15_DATA);
    return Data;
}

u32 XTransformer_Get_val_r(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_DATA);
    return Data;
}

u32 XTransformer_Get_val_r_vld(XTransformer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTransformer_ReadReg(InstancePtr->Control_BaseAddress, XTRANSFORMER_CONTROL_ADDR_VAL_R_CTRL);
    return Data & 0x1;
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


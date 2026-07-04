// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XQ16_QKSV2_D16_H
#define XQ16_QKSV2_D16_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xq16_qksv2_d16_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XQ16_qksv2_d16_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XQ16_qksv2_d16;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XQ16_qksv2_d16_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XQ16_qksv2_d16_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XQ16_qksv2_d16_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XQ16_qksv2_d16_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XQ16_qksv2_d16_Initialize(XQ16_qksv2_d16 *InstancePtr, u16 DeviceId);
XQ16_qksv2_d16_Config* XQ16_qksv2_d16_LookupConfig(u16 DeviceId);
int XQ16_qksv2_d16_CfgInitialize(XQ16_qksv2_d16 *InstancePtr, XQ16_qksv2_d16_Config *ConfigPtr);
#else
int XQ16_qksv2_d16_Initialize(XQ16_qksv2_d16 *InstancePtr, const char* InstanceName);
int XQ16_qksv2_d16_Release(XQ16_qksv2_d16 *InstancePtr);
#endif

void XQ16_qksv2_d16_Start(XQ16_qksv2_d16 *InstancePtr);
u32 XQ16_qksv2_d16_IsDone(XQ16_qksv2_d16 *InstancePtr);
u32 XQ16_qksv2_d16_IsIdle(XQ16_qksv2_d16 *InstancePtr);
u32 XQ16_qksv2_d16_IsReady(XQ16_qksv2_d16 *InstancePtr);
void XQ16_qksv2_d16_EnableAutoRestart(XQ16_qksv2_d16 *InstancePtr);
void XQ16_qksv2_d16_DisableAutoRestart(XQ16_qksv2_d16 *InstancePtr);

void XQ16_qksv2_d16_Set_input_r(XQ16_qksv2_d16 *InstancePtr, u64 Data);
u64 XQ16_qksv2_d16_Get_input_r(XQ16_qksv2_d16 *InstancePtr);
void XQ16_qksv2_d16_Set_logits(XQ16_qksv2_d16 *InstancePtr, u64 Data);
u64 XQ16_qksv2_d16_Get_logits(XQ16_qksv2_d16 *InstancePtr);

void XQ16_qksv2_d16_InterruptGlobalEnable(XQ16_qksv2_d16 *InstancePtr);
void XQ16_qksv2_d16_InterruptGlobalDisable(XQ16_qksv2_d16 *InstancePtr);
void XQ16_qksv2_d16_InterruptEnable(XQ16_qksv2_d16 *InstancePtr, u32 Mask);
void XQ16_qksv2_d16_InterruptDisable(XQ16_qksv2_d16 *InstancePtr, u32 Mask);
void XQ16_qksv2_d16_InterruptClear(XQ16_qksv2_d16 *InstancePtr, u32 Mask);
u32 XQ16_qksv2_d16_InterruptGetEnabled(XQ16_qksv2_d16 *InstancePtr);
u32 XQ16_qksv2_d16_InterruptGetStatus(XQ16_qksv2_d16 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

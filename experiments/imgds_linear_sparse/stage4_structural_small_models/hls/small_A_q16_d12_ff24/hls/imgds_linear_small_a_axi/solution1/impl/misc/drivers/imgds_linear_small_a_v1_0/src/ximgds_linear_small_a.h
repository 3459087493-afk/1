// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XIMGDS_LINEAR_SMALL_A_H
#define XIMGDS_LINEAR_SMALL_A_H

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
#include "ximgds_linear_small_a_hw.h"

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
} XImgds_linear_small_a_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XImgds_linear_small_a;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XImgds_linear_small_a_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XImgds_linear_small_a_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XImgds_linear_small_a_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XImgds_linear_small_a_ReadReg(BaseAddress, RegOffset) \
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
int XImgds_linear_small_a_Initialize(XImgds_linear_small_a *InstancePtr, u16 DeviceId);
XImgds_linear_small_a_Config* XImgds_linear_small_a_LookupConfig(u16 DeviceId);
int XImgds_linear_small_a_CfgInitialize(XImgds_linear_small_a *InstancePtr, XImgds_linear_small_a_Config *ConfigPtr);
#else
int XImgds_linear_small_a_Initialize(XImgds_linear_small_a *InstancePtr, const char* InstanceName);
int XImgds_linear_small_a_Release(XImgds_linear_small_a *InstancePtr);
#endif

void XImgds_linear_small_a_Start(XImgds_linear_small_a *InstancePtr);
u32 XImgds_linear_small_a_IsDone(XImgds_linear_small_a *InstancePtr);
u32 XImgds_linear_small_a_IsIdle(XImgds_linear_small_a *InstancePtr);
u32 XImgds_linear_small_a_IsReady(XImgds_linear_small_a *InstancePtr);
void XImgds_linear_small_a_EnableAutoRestart(XImgds_linear_small_a *InstancePtr);
void XImgds_linear_small_a_DisableAutoRestart(XImgds_linear_small_a *InstancePtr);

void XImgds_linear_small_a_Set_input_r(XImgds_linear_small_a *InstancePtr, u64 Data);
u64 XImgds_linear_small_a_Get_input_r(XImgds_linear_small_a *InstancePtr);
void XImgds_linear_small_a_Set_logits(XImgds_linear_small_a *InstancePtr, u64 Data);
u64 XImgds_linear_small_a_Get_logits(XImgds_linear_small_a *InstancePtr);

void XImgds_linear_small_a_InterruptGlobalEnable(XImgds_linear_small_a *InstancePtr);
void XImgds_linear_small_a_InterruptGlobalDisable(XImgds_linear_small_a *InstancePtr);
void XImgds_linear_small_a_InterruptEnable(XImgds_linear_small_a *InstancePtr, u32 Mask);
void XImgds_linear_small_a_InterruptDisable(XImgds_linear_small_a *InstancePtr, u32 Mask);
void XImgds_linear_small_a_InterruptClear(XImgds_linear_small_a *InstancePtr, u32 Mask);
u32 XImgds_linear_small_a_InterruptGetEnabled(XImgds_linear_small_a *InstancePtr);
u32 XImgds_linear_small_a_InterruptGetStatus(XImgds_linear_small_a *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTRANSFORMER_H
#define XTRANSFORMER_H

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
#include "xtransformer_hw.h"

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
} XTransformer_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XTransformer;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTransformer_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTransformer_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTransformer_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTransformer_ReadReg(BaseAddress, RegOffset) \
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
int XTransformer_Initialize(XTransformer *InstancePtr, u16 DeviceId);
XTransformer_Config* XTransformer_LookupConfig(u16 DeviceId);
int XTransformer_CfgInitialize(XTransformer *InstancePtr, XTransformer_Config *ConfigPtr);
#else
int XTransformer_Initialize(XTransformer *InstancePtr, const char* InstanceName);
int XTransformer_Release(XTransformer *InstancePtr);
#endif

void XTransformer_Start(XTransformer *InstancePtr);
u32 XTransformer_IsDone(XTransformer *InstancePtr);
u32 XTransformer_IsIdle(XTransformer *InstancePtr);
u32 XTransformer_IsReady(XTransformer *InstancePtr);
void XTransformer_EnableAutoRestart(XTransformer *InstancePtr);
void XTransformer_DisableAutoRestart(XTransformer *InstancePtr);

void XTransformer_Set_input_array(XTransformer *InstancePtr, u64 Data);
u64 XTransformer_Get_input_array(XTransformer *InstancePtr);
void XTransformer_Set_val_r(XTransformer *InstancePtr, u64 Data);
u64 XTransformer_Get_val_r(XTransformer *InstancePtr);

void XTransformer_InterruptGlobalEnable(XTransformer *InstancePtr);
void XTransformer_InterruptGlobalDisable(XTransformer *InstancePtr);
void XTransformer_InterruptEnable(XTransformer *InstancePtr, u32 Mask);
void XTransformer_InterruptDisable(XTransformer *InstancePtr, u32 Mask);
void XTransformer_InterruptClear(XTransformer *InstancePtr, u32 Mask);
u32 XTransformer_InterruptGetEnabled(XTransformer *InstancePtr);
u32 XTransformer_InterruptGetStatus(XTransformer *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XQ16_ESLA_K13_H
#define XQ16_ESLA_K13_H

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
#include "xq16_esla_k13_hw.h"

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
} XQ16_esla_k13_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XQ16_esla_k13;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XQ16_esla_k13_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XQ16_esla_k13_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XQ16_esla_k13_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XQ16_esla_k13_ReadReg(BaseAddress, RegOffset) \
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
int XQ16_esla_k13_Initialize(XQ16_esla_k13 *InstancePtr, u16 DeviceId);
XQ16_esla_k13_Config* XQ16_esla_k13_LookupConfig(u16 DeviceId);
int XQ16_esla_k13_CfgInitialize(XQ16_esla_k13 *InstancePtr, XQ16_esla_k13_Config *ConfigPtr);
#else
int XQ16_esla_k13_Initialize(XQ16_esla_k13 *InstancePtr, const char* InstanceName);
int XQ16_esla_k13_Release(XQ16_esla_k13 *InstancePtr);
#endif

void XQ16_esla_k13_Start(XQ16_esla_k13 *InstancePtr);
u32 XQ16_esla_k13_IsDone(XQ16_esla_k13 *InstancePtr);
u32 XQ16_esla_k13_IsIdle(XQ16_esla_k13 *InstancePtr);
u32 XQ16_esla_k13_IsReady(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_EnableAutoRestart(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_DisableAutoRestart(XQ16_esla_k13 *InstancePtr);

void XQ16_esla_k13_Set_input_r(XQ16_esla_k13 *InstancePtr, u64 Data);
u64 XQ16_esla_k13_Get_input_r(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_Set_logits(XQ16_esla_k13 *InstancePtr, u64 Data);
u64 XQ16_esla_k13_Get_logits(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_Set_active_token_indices(XQ16_esla_k13 *InstancePtr, u64 Data);
u64 XQ16_esla_k13_Get_active_token_indices(XQ16_esla_k13 *InstancePtr);

void XQ16_esla_k13_InterruptGlobalEnable(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_InterruptGlobalDisable(XQ16_esla_k13 *InstancePtr);
void XQ16_esla_k13_InterruptEnable(XQ16_esla_k13 *InstancePtr, u32 Mask);
void XQ16_esla_k13_InterruptDisable(XQ16_esla_k13 *InstancePtr, u32 Mask);
void XQ16_esla_k13_InterruptClear(XQ16_esla_k13 *InstancePtr, u32 Mask);
u32 XQ16_esla_k13_InterruptGetEnabled(XQ16_esla_k13 *InstancePtr);
u32 XQ16_esla_k13_InterruptGetStatus(XQ16_esla_k13 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

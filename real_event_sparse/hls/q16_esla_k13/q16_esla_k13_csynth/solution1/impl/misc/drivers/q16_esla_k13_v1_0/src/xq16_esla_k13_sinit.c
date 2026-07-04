// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xq16_esla_k13.h"

extern XQ16_esla_k13_Config XQ16_esla_k13_ConfigTable[];

XQ16_esla_k13_Config *XQ16_esla_k13_LookupConfig(u16 DeviceId) {
	XQ16_esla_k13_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XQ16_ESLA_K13_NUM_INSTANCES; Index++) {
		if (XQ16_esla_k13_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XQ16_esla_k13_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XQ16_esla_k13_Initialize(XQ16_esla_k13 *InstancePtr, u16 DeviceId) {
	XQ16_esla_k13_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XQ16_esla_k13_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XQ16_esla_k13_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


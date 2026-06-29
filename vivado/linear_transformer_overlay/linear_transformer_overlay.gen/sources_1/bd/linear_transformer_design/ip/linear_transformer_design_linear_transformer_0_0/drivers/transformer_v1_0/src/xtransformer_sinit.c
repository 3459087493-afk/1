// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtransformer.h"

extern XTransformer_Config XTransformer_ConfigTable[];

XTransformer_Config *XTransformer_LookupConfig(u16 DeviceId) {
	XTransformer_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTRANSFORMER_NUM_INSTANCES; Index++) {
		if (XTransformer_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTransformer_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTransformer_Initialize(XTransformer *InstancePtr, u16 DeviceId) {
	XTransformer_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTransformer_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTransformer_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


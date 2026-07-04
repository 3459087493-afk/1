// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "ximgds_linear_tiny.h"

extern XImgds_linear_tiny_Config XImgds_linear_tiny_ConfigTable[];

XImgds_linear_tiny_Config *XImgds_linear_tiny_LookupConfig(u16 DeviceId) {
	XImgds_linear_tiny_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XIMGDS_LINEAR_TINY_NUM_INSTANCES; Index++) {
		if (XImgds_linear_tiny_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XImgds_linear_tiny_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XImgds_linear_tiny_Initialize(XImgds_linear_tiny *InstancePtr, u16 DeviceId) {
	XImgds_linear_tiny_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XImgds_linear_tiny_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XImgds_linear_tiny_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xq16_qksv2_d14.h"

extern XQ16_qksv2_d14_Config XQ16_qksv2_d14_ConfigTable[];

XQ16_qksv2_d14_Config *XQ16_qksv2_d14_LookupConfig(u16 DeviceId) {
	XQ16_qksv2_d14_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XQ16_QKSV2_D14_NUM_INSTANCES; Index++) {
		if (XQ16_qksv2_d14_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XQ16_qksv2_d14_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XQ16_qksv2_d14_Initialize(XQ16_qksv2_d14 *InstancePtr, u16 DeviceId) {
	XQ16_qksv2_d14_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XQ16_qksv2_d14_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XQ16_qksv2_d14_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


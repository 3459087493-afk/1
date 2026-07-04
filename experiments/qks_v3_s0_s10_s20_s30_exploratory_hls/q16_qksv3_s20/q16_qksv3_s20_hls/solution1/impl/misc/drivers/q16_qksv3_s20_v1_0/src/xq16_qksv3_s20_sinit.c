// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xq16_qksv3_s20.h"

extern XQ16_qksv3_s20_Config XQ16_qksv3_s20_ConfigTable[];

XQ16_qksv3_s20_Config *XQ16_qksv3_s20_LookupConfig(u16 DeviceId) {
	XQ16_qksv3_s20_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XQ16_QKSV3_S20_NUM_INSTANCES; Index++) {
		if (XQ16_qksv3_s20_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XQ16_qksv3_s20_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XQ16_qksv3_s20_Initialize(XQ16_qksv3_s20 *InstancePtr, u16 DeviceId) {
	XQ16_qksv3_s20_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XQ16_qksv3_s20_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XQ16_qksv3_s20_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


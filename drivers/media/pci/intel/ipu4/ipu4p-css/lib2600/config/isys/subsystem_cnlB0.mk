# # #
# Support for Intel Camera Imaging ISP subsystem.
# Copyright (c) 2010 - 2018, Intel Corporation.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details
#

############################################################################
# This file is used to specify versions and properties of ISYS firmware
# components. Please note that these are subsystem specific. System specific
# properties should go to system_$IPU_SYSVER.mk. Also the device versions
# should be defined under "devices" or should be taken from the SDK.
############################################################################

############################################################################
# FIRMWARE RELATED VARIABLES
############################################################################

# Activate loading params and storing stats DDR<->REGs with DMA
ISYS_USE_ISA_DMA                 = 1
#DMA does not work with AF due to a known bug
DISABLE_AF_STAT_DMA              = 1
# Used in ISA module
ISYS_ISL_DPC_DPC_V2              = 1

# Specification for Isys server's fixed globals' locations
REGMEM_OFFSET				= 0	# Starting from 0
REGMEM_SECURE_OFFSET			= 4096
REGMEM_SIZE				= 34
REGMEM_WORD_BYTES			= 4
FW_LOAD_NO_OF_REQUEST_OFFSET		= 136	# Taken from REGMEM_OFFSET + REGMEM_SIZE_BYTES
FW_LOAD_NO_OF_REQUEST_SIZE_BYTES	= 4

# Workarounds:

# This WA is not to pipeline store frame commands for SID processors that control a Str2Vec (ISA output)
WA_HSD1304553438                 = 1

# FW workaround for HSD 1404347241. Disable clock gating for CSI2 DPHY Receiver ports
# This is also specified in the CNLB0 clock gating document:
#     https://sharepoint.ger.ith.intel.com/sites/ICG_Arch/Shared%20Documents/
#           IPU%20Specs/IPU4-P/HAS/CNL%20B0%20clock%20gating%20registers.xlsx
DISABLE_CSI2_RX_DPHY_CLK_GATE    = 1

# Larger than specified frames that complete mid-line
WA_HSD1209062354                 = 0

# WA to disable clock gating for the devices in the CSI receivers needed for using the mipi_pkt_gen device
WA_HSD1805168877		 = 0

# Support IBUF soft-reset at stream start
SOFT_RESET_IBUF_STREAM_START_SUPPORT = 0

############################################################################
# TESTING RELATED VARIABLES
############################################################################

# Cannot remove this define
# Used in mipi_capture, isys_utils.mk, and stream_controller.mk
ISYS_DISABLE_VERIFY_RECEIVED_SOF_EOF     = 0

ISYS_ACCESS_BLOCKER_VERSION      = v1

HAS_SPC				= 1

# Support dual command context for VTIO - concurrent secure and non-secure streams
ISYS_HAS_DUAL_CMD_CTX_SUPPORT	= 1

AB_CONFIG_ARRAY_SIZE = 50

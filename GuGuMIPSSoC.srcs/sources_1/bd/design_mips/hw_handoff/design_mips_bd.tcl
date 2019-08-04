
################################################################
# This is a generated script based on design: design_mips
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_mips_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# mycpu_top

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a200tfbg676-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_mips

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_design_mips_mig_7series_0_0 { str_mig_prj_filepath } {

   file mkdir [ file dirname "$str_mig_prj_filepath" ]
   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {﻿<?xml version="1.0" encoding="UTF-8" standalone="no" ?>}
   puts $mig_prj_file {<Project NoOfControllers="1">}
   puts $mig_prj_file {  <ModuleName>design_mips_mig_7series_0_0</ModuleName>}
   puts $mig_prj_file {  <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {  <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {  <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {  <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {  <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {  <XADC_En>Enabled</XADC_En>}
   puts $mig_prj_file {  <TargetFPGA>xc7a200t-fbg676/-2</TargetFPGA>}
   puts $mig_prj_file {  <Version>4.2</Version>}
   puts $mig_prj_file {  <SystemClock>No Buffer</SystemClock>}
   puts $mig_prj_file {  <ReferenceClock>No Buffer</ReferenceClock>}
   puts $mig_prj_file {  <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {  <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {  <InternalVref>1</InternalVref>}
   puts $mig_prj_file {  <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {  <dci_cascade>0</dci_cascade>}
   puts $mig_prj_file {  <Controller number="0">}
   puts $mig_prj_file {    <MemoryDevice>DDR3_SDRAM/Components/MT41J64M16XX-125G</MemoryDevice>}
   puts $mig_prj_file {    <TimePeriod>2500</TimePeriod>}
   puts $mig_prj_file {    <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {    <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {    <InputClkFreq>100</InputClkFreq>}
   puts $mig_prj_file {    <UIExtraClocks>1</UIExtraClocks>}
   puts $mig_prj_file {    <MMCM_VCO>800</MMCM_VCO>}
   puts $mig_prj_file {    <MMCMClkOut0>16.000</MMCMClkOut0>}
   puts $mig_prj_file {    <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {    <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {    <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {    <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {    <DataWidth>16</DataWidth>}
   puts $mig_prj_file {    <DeepMemory>1</DeepMemory>}
   puts $mig_prj_file {    <DataMask>1</DataMask>}
   puts $mig_prj_file {    <ECC>Disabled</ECC>}
   puts $mig_prj_file {    <Ordering>Normal</Ordering>}
   puts $mig_prj_file {    <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {    <CustomPart>FALSE</CustomPart>}
   puts $mig_prj_file {    <NewPartName></NewPartName>}
   puts $mig_prj_file {    <RowAddress>13</RowAddress>}
   puts $mig_prj_file {    <ColAddress>10</ColAddress>}
   puts $mig_prj_file {    <BankAddress>3</BankAddress>}
   puts $mig_prj_file {    <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {    <C0_MEM_SIZE>134217728</C0_MEM_SIZE>}
   puts $mig_prj_file {    <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {    <PinSelection>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="E18" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="F20" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="H16" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="G16" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="H14" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="H15" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="G17" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="F17" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="F18" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="F19" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="G15" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="F15" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="G19" SLEW="FAST" VCCAUX_IO="" name="ddr3_addr[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="C17" SLEW="FAST" VCCAUX_IO="" name="ddr3_ba[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="B17" SLEW="FAST" VCCAUX_IO="" name="ddr3_ba[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="E16" SLEW="FAST" VCCAUX_IO="" name="ddr3_ba[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="A18" SLEW="FAST" VCCAUX_IO="" name="ddr3_cas_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15" PADName="C18" SLEW="FAST" VCCAUX_IO="" name="ddr3_ck_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15" PADName="D18" SLEW="FAST" VCCAUX_IO="" name="ddr3_ck_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="D16" SLEW="FAST" VCCAUX_IO="" name="ddr3_cke[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="E21" SLEW="FAST" VCCAUX_IO="" name="ddr3_dm[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="D23" SLEW="FAST" VCCAUX_IO="" name="ddr3_dm[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="E20" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C23" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="B26" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="A25" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C26" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[13]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C24" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[14]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="B25" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[15]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C21" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="D19" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="A22" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="D20" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="B21" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C19" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="B22" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="C22" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="SSTL15" PADName="B24" SLEW="FAST" VCCAUX_IO="" name="ddr3_dq[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="DIFF_SSTL15" PADName="A20" SLEW="FAST" VCCAUX_IO="" name="ddr3_dqs_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="DIFF_SSTL15" PADName="A24" SLEW="FAST" VCCAUX_IO="" name="ddr3_dqs_n[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="DIFF_SSTL15" PADName="B20" SLEW="FAST" VCCAUX_IO="" name="ddr3_dqs_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="UNTUNED_SPLIT_50" IOSTANDARD="DIFF_SSTL15" PADName="A23" SLEW="FAST" VCCAUX_IO="" name="ddr3_dqs_p[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="E17" SLEW="FAST" VCCAUX_IO="" name="ddr3_odt[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="A17" SLEW="FAST" VCCAUX_IO="" name="ddr3_ras_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="LVCMOS15" PADName="A19" SLEW="FAST" VCCAUX_IO="" name="ddr3_reset_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="B19" SLEW="FAST" VCCAUX_IO="" name="ddr3_we_n"/>}
   puts $mig_prj_file {    </PinSelection>}
   puts $mig_prj_file {    <System_Control>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="sys_rst"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="init_calib_complete"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="tg_compare_error"/>}
   puts $mig_prj_file {    </System_Control>}
   puts $mig_prj_file {    <TimingParameters>}
   puts $mig_prj_file {      <Parameters tcke="5" tfaw="40" tras="35" trcd="13.75" trefi="7.8" trfc="110" trp="13.75" trrd="7.5" trtp="7.5" twtr="7.5"/>}
   puts $mig_prj_file {    </TimingParameters>}
   puts $mig_prj_file {    <mrBurstLength name="Burst Length">8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {    <mrBurstType name="Read Burst Type and Length">Sequential</mrBurstType>}
   puts $mig_prj_file {    <mrCasLatency name="CAS Latency">6</mrCasLatency>}
   puts $mig_prj_file {    <mrMode name="Mode">Normal</mrMode>}
   puts $mig_prj_file {    <mrDllReset name="DLL Reset">No</mrDllReset>}
   puts $mig_prj_file {    <mrPdMode name="DLL control for precharge PD">Slow Exit</mrPdMode>}
   puts $mig_prj_file {    <emrDllEnable name="DLL Enable">Enable</emrDllEnable>}
   puts $mig_prj_file {    <emrOutputDriveStrength name="Output Driver Impedance Control">RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {    <emrMirrorSelection name="Address Mirroring">Disable</emrMirrorSelection>}
   puts $mig_prj_file {    <emrCSSelection name="Controller Chip Select Pin">Disable</emrCSSelection>}
   puts $mig_prj_file {    <emrRTT name="RTT (nominal) - On Die Termination (ODT)">RZQ/4</emrRTT>}
   puts $mig_prj_file {    <emrPosted name="Additive Latency (AL)">0</emrPosted>}
   puts $mig_prj_file {    <emrOCD name="Write Leveling Enable">Disabled</emrOCD>}
   puts $mig_prj_file {    <emrDQS name="TDQS enable">Enabled</emrDQS>}
   puts $mig_prj_file {    <emrRDQS name="Qoff">Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {    <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh">Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {    <mr2CasWriteLatency name="CAS write latency">5</mr2CasWriteLatency>}
   puts $mig_prj_file {    <mr2AutoSelfRefresh name="Auto Self Refresh">Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {    <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate">Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {    <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)">Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {    <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {    <AXIParameters>}
   puts $mig_prj_file {      <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {      <C0_S_AXI_ADDR_WIDTH>27</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_DATA_WIDTH>32</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_ID_WIDTH>4</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_SUPPORTS_NARROW_BURST>1</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {    </AXIParameters>}
   puts $mig_prj_file {  </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_design_mips_mig_7series_0_0()



##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR3_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3_0 ]
  set LCD_data_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 LCD_data_0 ]
  set cfg_flash [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 cfg_flash ]
  set mdio [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio ]
  set mii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mii_rtl:1.0 mii ]
  set ps2_clk [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 ps2_clk ]
  set ps2_dat [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 ps2_dat ]
  set spi_flash [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 spi_flash ]
  set uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart ]
  set utmi_data_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 utmi_data_0 ]

  # Create ports
  set LCD_csel_0 [ create_bd_port -dir O LCD_csel_0 ]
  set LCD_lighton_0 [ create_bd_port -dir O -from 0 -to 0 LCD_lighton_0 ]
  set LCD_nrst_0 [ create_bd_port -dir O LCD_nrst_0 ]
  set LCD_rd_0 [ create_bd_port -dir O LCD_rd_0 ]
  set LCD_rs_0 [ create_bd_port -dir O LCD_rs_0 ]
  set LCD_wr_0 [ create_bd_port -dir O LCD_wr_0 ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_RESET {resetn} \
 ] $clk
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set led_rg0 [ create_bd_port -dir O -from 1 -to 0 led_rg0 ]
  set led_rg1 [ create_bd_port -dir O -from 1 -to 0 led_rg1 ]
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set utmi_chrgvbus_0 [ create_bd_port -dir O utmi_chrgvbus_0 ]
  set utmi_clock_0 [ create_bd_port -dir I -type clk utmi_clock_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {60000000} \
 ] $utmi_clock_0
  set utmi_dischrgvbus_0 [ create_bd_port -dir O utmi_dischrgvbus_0 ]
  set utmi_dmpulldown_0 [ create_bd_port -dir O utmi_dmpulldown_0 ]
  set utmi_dppulldown_0 [ create_bd_port -dir O utmi_dppulldown_0 ]
  set utmi_hostdisc_0 [ create_bd_port -dir I utmi_hostdisc_0 ]
  set utmi_iddig_0 [ create_bd_port -dir I utmi_iddig_0 ]
  set utmi_idpullup_0 [ create_bd_port -dir O utmi_idpullup_0 ]
  set utmi_linestate_0 [ create_bd_port -dir I -from 1 -to 0 utmi_linestate_0 ]
  set utmi_opmode_0 [ create_bd_port -dir O -from 1 -to 0 utmi_opmode_0 ]
  set utmi_reset_0 [ create_bd_port -dir O -type rst utmi_reset_0 ]
  set utmi_rxactive_0 [ create_bd_port -dir I utmi_rxactive_0 ]
  set utmi_rxerror_0 [ create_bd_port -dir I utmi_rxerror_0 ]
  set utmi_rxvalid_0 [ create_bd_port -dir I utmi_rxvalid_0 ]
  set utmi_sessend_0 [ create_bd_port -dir I utmi_sessend_0 ]
  set utmi_suspend_n_0 [ create_bd_port -dir O utmi_suspend_n_0 ]
  set utmi_termsel_0 [ create_bd_port -dir O utmi_termsel_0 ]
  set utmi_txready_0 [ create_bd_port -dir I utmi_txready_0 ]
  set utmi_txvalid_0 [ create_bd_port -dir O utmi_txvalid_0 ]
  set utmi_vbusvalid_0 [ create_bd_port -dir I utmi_vbusvalid_0 ]
  set utmi_xcvrsel_0 [ create_bd_port -dir O -from 1 -to 0 utmi_xcvrsel_0 ]

  # Create instance: altera_up_ps2_0, and set properties
  set altera_up_ps2_0 [ create_bd_cell -type ip -vlnv user.org:user:altera_up_ps2:1.2 altera_up_ps2_0 ]
  set_property -dict [ list \
   CONFIG.CLK_FREQ {50000000} \
 ] $altera_up_ps2_0

  # Create instance: axi_apb_bridge_0, and set properties
  set axi_apb_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge:3.0 axi_apb_bridge_0 ]
  set_property -dict [ list \
   CONFIG.C_APB_NUM_SLAVES {1} \
   CONFIG.C_M_APB_PROTOCOL {apb4} \
 ] $axi_apb_bridge_0

  # Create instance: axi_apb_bridge_1, and set properties
  set axi_apb_bridge_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge:3.0 axi_apb_bridge_1 ]
  set_property -dict [ list \
   CONFIG.C_APB_NUM_SLAVES {1} \
   CONFIG.C_M_APB_PROTOCOL {apb4} \
 ] $axi_apb_bridge_1

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_cfg_spi_0, and set properties
  set axi_cfg_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_cfg_spi_0 ]
  set_property -dict [ list \
   CONFIG.C_FIFO_DEPTH {256} \
   CONFIG.C_SCK_RATIO {2} \
   CONFIG.C_SPI_MEMORY {3} \
   CONFIG.C_SPI_MEM_ADDR_BITS {24} \
   CONFIG.C_SPI_MODE {0} \
   CONFIG.C_TYPE_OF_AXI4_INTERFACE {1} \
   CONFIG.C_USE_STARTUP {1} \
   CONFIG.C_USE_STARTUP_INT {1} \
   CONFIG.C_XIP_MODE {1} \
 ] $axi_cfg_spi_0

  # Create instance: axi_ethernetlite_0, and set properties
  set axi_ethernetlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernetlite:3.0 axi_ethernetlite_0 ]

  # Create instance: axi_intc_0, and set properties
  set axi_intc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 axi_intc_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.NUM_MI {12} \
   CONFIG.NUM_SI {1} \
 ] $axi_mem_intercon

  # Create instance: axi_quad_spi_1, and set properties
  set axi_quad_spi_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_1 ]
  set_property -dict [ list \
   CONFIG.C_FIFO_DEPTH {256} \
   CONFIG.C_SCK_RATIO {2} \
   CONFIG.C_SPI_MEMORY {2} \
   CONFIG.C_SPI_MEM_ADDR_BITS {24} \
   CONFIG.C_SPI_MODE {2} \
   CONFIG.C_TYPE_OF_AXI4_INTERFACE {0} \
   CONFIG.C_USE_STARTUP {0} \
   CONFIG.C_USE_STARTUP_INT {0} \
   CONFIG.C_XIP_MODE {0} \
 ] $axi_quad_spi_1

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {115200} \
 ] $axi_uartlite_0

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.Coe_File {../../../../../../../GuGuMIPS/boot/bootloader.coe} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Fill_Remaining_Memory_Locations {false} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_ROM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Port_B_Clock {0} \
   CONFIG.Port_B_Enable_Rate {0} \
   CONFIG.Port_B_Write_Rate {0} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {false} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {130.958} \
   CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT2_JITTER {114.829} \
   CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {183.243} \
   CONFIG.CLKOUT3_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {20.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {50} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: confreg_0, and set properties
  set confreg_0 [ create_bd_cell -type ip -vlnv user.org:user:confreg:1.0 confreg_0 ]

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.2 mig_7series_0 ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_b.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file_design_mips_mig_7series_0_0 $str_mig_file_path

  set_property -dict [ list \
   CONFIG.BOARD_MIG_PARAM {Custom} \
   CONFIG.RESET_BOARD_INTERFACE {Custom} \
   CONFIG.XML_INPUT_FILE {mig_b.prj} \
 ] $mig_7series_0

  # Create instance: mycpu_top_0, and set properties
  set block_name mycpu_top
  set block_cell_name mycpu_top_0
  if { [catch {set mycpu_top_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mycpu_top_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: nt35510_apb_adapter_0, and set properties
  set nt35510_apb_adapter_0 [ create_bd_cell -type ip -vlnv user.org:user:nt35510_apb_adapter:1.0 nt35510_apb_adapter_0 ]

  # Create instance: rst_mig_7series_0_cpu, and set properties
  set rst_mig_7series_0_cpu [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_cpu ]

  # Create instance: rst_utmi_clock_0_60M, and set properties
  set rst_utmi_clock_0_60M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_utmi_clock_0_60M ]

  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_BRAM_CNT {48.5} \
   CONFIG.C_DATA_DEPTH {8192} \
   CONFIG.C_MON_TYPE {MIX} \
   CONFIG.C_NUM_MONITOR_SLOTS {1} \
   CONFIG.C_NUM_OF_PROBES {7} \
   CONFIG.C_PROBE0_TYPE {0} \
   CONFIG.C_PROBE1_TYPE {0} \
   CONFIG.C_PROBE2_TYPE {0} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
   CONFIG.C_SLOT_1_APC_EN {0} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
 ] $system_ila_0

  # Create instance: system_ila_1, and set properties
  set system_ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_1 ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {MIX} \
   CONFIG.C_NUM_MONITOR_SLOTS {1} \
   CONFIG.C_NUM_OF_PROBES {19} \
   CONFIG.C_PROBE0_TYPE {0} \
   CONFIG.C_PROBE10_TYPE {0} \
   CONFIG.C_PROBE11_TYPE {0} \
   CONFIG.C_PROBE12_TYPE {0} \
   CONFIG.C_PROBE13_TYPE {0} \
   CONFIG.C_PROBE14_TYPE {0} \
   CONFIG.C_PROBE15_TYPE {0} \
   CONFIG.C_PROBE16_TYPE {0} \
   CONFIG.C_PROBE17_TYPE {0} \
   CONFIG.C_PROBE18_TYPE {0} \
   CONFIG.C_PROBE1_TYPE {0} \
   CONFIG.C_PROBE2_TYPE {0} \
   CONFIG.C_PROBE3_TYPE {0} \
   CONFIG.C_PROBE4_TYPE {0} \
   CONFIG.C_PROBE5_TYPE {0} \
   CONFIG.C_PROBE6_TYPE {0} \
   CONFIG.C_PROBE7_TYPE {0} \
   CONFIG.C_PROBE8_TYPE {0} \
   CONFIG.C_PROBE9_TYPE {0} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:gpio_rtl:1.0} \
   CONFIG.C_SLOT_0_TYPE {0} \
 ] $system_ila_1

  # Create instance: usbh_host_0, and set properties
  set usbh_host_0 [ create_bd_cell -type ip -vlnv user.org:user:usbh_host:1.3 usbh_host_0 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_1

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_EN_PROBE_IN_ACTIVITY {0} \
   CONFIG.C_NUM_PROBE_IN {0} \
   CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
 ] $vio_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {6} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net altera_up_ps2_0_ps2_clk [get_bd_intf_ports ps2_clk] [get_bd_intf_pins altera_up_ps2_0/ps2_clk]
  connect_bd_intf_net -intf_net altera_up_ps2_0_ps2_dat [get_bd_intf_ports ps2_dat] [get_bd_intf_pins altera_up_ps2_0/ps2_dat]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M [get_bd_intf_pins altera_up_ps2_0/APB] [get_bd_intf_pins axi_apb_bridge_0/APB_M]
  connect_bd_intf_net -intf_net axi_apb_bridge_1_APB_M [get_bd_intf_pins axi_apb_bridge_1/APB_M] [get_bd_intf_pins nt35510_apb_adapter_0/APB]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_ethernetlite_0_MDIO [get_bd_intf_ports mdio] [get_bd_intf_pins axi_ethernetlite_0/MDIO]
  connect_bd_intf_net -intf_net axi_ethernetlite_0_MII [get_bd_intf_ports mii] [get_bd_intf_pins axi_ethernetlite_0/MII]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M02_AXI [get_bd_intf_pins axi_mem_intercon/M02_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M03_AXI [get_bd_intf_pins axi_intc_0/s_axi] [get_bd_intf_pins axi_mem_intercon/M03_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M04_AXI [get_bd_intf_pins axi_ethernetlite_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M04_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M05_AXI [get_bd_intf_pins axi_cfg_spi_0/AXI_LITE] [get_bd_intf_pins axi_mem_intercon/M05_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M06_AXI [get_bd_intf_pins axi_cfg_spi_0/AXI_FULL] [get_bd_intf_pins axi_mem_intercon/M06_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M07_AXI [get_bd_intf_pins axi_apb_bridge_0/AXI4_LITE] [get_bd_intf_pins axi_mem_intercon/M07_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M08_AXI [get_bd_intf_pins axi_mem_intercon/M08_AXI] [get_bd_intf_pins usbh_host_0/cfg]
  connect_bd_intf_net -intf_net axi_mem_intercon_M09_AXI [get_bd_intf_pins axi_mem_intercon/M09_AXI] [get_bd_intf_pins confreg_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M10_AXI [get_bd_intf_pins axi_mem_intercon/M10_AXI] [get_bd_intf_pins axi_quad_spi_1/AXI_LITE]
  connect_bd_intf_net -intf_net axi_mem_intercon_M11_AXI [get_bd_intf_pins axi_apb_bridge_1/AXI4_LITE] [get_bd_intf_pins axi_mem_intercon/M11_AXI]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports cfg_flash] [get_bd_intf_pins axi_cfg_spi_0/SPI_0]
  connect_bd_intf_net -intf_net axi_quad_spi_1_SPI_0 [get_bd_intf_ports spi_flash] [get_bd_intf_pins axi_quad_spi_1/SPI_0]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M00_AXI]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports DDR3_0] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net mycpu_top_0_interface_aximm [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins mycpu_top_0/interface_aximm]
connect_bd_intf_net -intf_net [get_bd_intf_nets mycpu_top_0_interface_aximm] [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins system_ila_0/SLOT_0_AXI]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets mycpu_top_0_interface_aximm]
  connect_bd_intf_net -intf_net nt35510_apb_adapter_0_LCD_data [get_bd_intf_ports LCD_data_0] [get_bd_intf_pins nt35510_apb_adapter_0/LCD_data]
  connect_bd_intf_net -intf_net usbh_host_0_utmi_data [get_bd_intf_ports utmi_data_0] [get_bd_intf_pins usbh_host_0/utmi_data]
connect_bd_intf_net -intf_net [get_bd_intf_nets usbh_host_0_utmi_data] [get_bd_intf_ports utmi_data_0] [get_bd_intf_pins system_ila_1/SLOT_0_GPIO]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets usbh_host_0_utmi_data]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins mycpu_top_0/aresetn] [get_bd_pins rst_mig_7series_0_cpu/interconnect_aresetn]
  connect_bd_net -net aclk_0_1 [get_bd_ports utmi_clock_0] [get_bd_pins axi_mem_intercon/M08_ACLK] [get_bd_pins rst_utmi_clock_0_60M/slowest_sync_clk] [get_bd_pins system_ila_1/clk] [get_bd_pins usbh_host_0/aclk]
  connect_bd_net -net altera_up_ps2_0_irq [get_bd_pins altera_up_ps2_0/irq] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_ethernetlite_0_ip2intc_irpt [get_bd_pins axi_ethernetlite_0/ip2intc_irpt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_intc_0_irq [get_bd_pins axi_intc_0/irq] [get_bd_pins mycpu_top_0/int]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt [get_bd_pins axi_cfg_spi_0/ip2intc_irpt] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_quad_spi_1_ip2intc_irpt [get_bd_pins axi_quad_spi_1/ip2intc_irpt] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins vio_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins mig_7series_0/sys_clk_i]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins mig_7series_0/clk_ref_i]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins axi_cfg_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_1/ext_spi_clk] [get_bd_pins clk_wiz_0/clk_out3]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net confreg_0_led [get_bd_ports led] [get_bd_pins confreg_0/led]
  connect_bd_net -net confreg_0_led_rg0 [get_bd_ports led_rg0] [get_bd_pins confreg_0/led_rg0]
  connect_bd_net -net confreg_0_led_rg1 [get_bd_ports led_rg1] [get_bd_pins confreg_0/led_rg1]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_cpu/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_addn_clk_0 [get_bd_pins altera_up_ps2_0/clk] [get_bd_pins axi_apb_bridge_0/s_axi_aclk] [get_bd_pins axi_apb_bridge_1/s_axi_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_cfg_spi_0/s_axi4_aclk] [get_bd_pins axi_cfg_spi_0/s_axi_aclk] [get_bd_pins axi_ethernetlite_0/s_axi_aclk] [get_bd_pins axi_intc_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/M03_ACLK] [get_bd_pins axi_mem_intercon/M04_ACLK] [get_bd_pins axi_mem_intercon/M05_ACLK] [get_bd_pins axi_mem_intercon/M06_ACLK] [get_bd_pins axi_mem_intercon/M07_ACLK] [get_bd_pins axi_mem_intercon/M09_ACLK] [get_bd_pins axi_mem_intercon/M10_ACLK] [get_bd_pins axi_mem_intercon/M11_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_quad_spi_1/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins confreg_0/s00_axi_aclk] [get_bd_pins mig_7series_0/ui_addn_clk_0] [get_bd_pins mycpu_top_0/aclk] [get_bd_pins nt35510_apb_adapter_0/clk] [get_bd_pins rst_mig_7series_0_cpu/slowest_sync_clk] [get_bd_pins system_ila_0/clk]
  connect_bd_net -net mig_7series_0_ui_clk [get_bd_pins axi_mem_intercon/M02_ACLK] [get_bd_pins mig_7series_0/ui_clk]
  connect_bd_net -net mycpu_top_0_cp0_cause_o [get_bd_pins mycpu_top_0/cp0_cause_o] [get_bd_pins system_ila_0/probe5]
  connect_bd_net -net mycpu_top_0_cp0_epc_o [get_bd_pins mycpu_top_0/cp0_epc_o] [get_bd_pins system_ila_0/probe6]
  connect_bd_net -net mycpu_top_0_cp0_status_o [get_bd_pins mycpu_top_0/cp0_status_o] [get_bd_pins system_ila_0/probe4]
  connect_bd_net -net mycpu_top_0_debug_wb_pc [get_bd_pins mycpu_top_0/debug_wb_pc] [get_bd_pins system_ila_0/probe0]
  connect_bd_net -net mycpu_top_0_debug_wb_rf_data [get_bd_pins mycpu_top_0/debug_wb_rf_data] [get_bd_pins system_ila_0/probe3]
  connect_bd_net -net mycpu_top_0_debug_wb_rf_wen [get_bd_pins mycpu_top_0/debug_wb_rf_wen] [get_bd_pins system_ila_0/probe1]
  connect_bd_net -net mycpu_top_0_debug_wb_rf_wnum [get_bd_pins mycpu_top_0/debug_wb_rf_wnum] [get_bd_pins system_ila_0/probe2]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_csel [get_bd_ports LCD_csel_0] [get_bd_pins nt35510_apb_adapter_0/LCD_csel]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_nrst [get_bd_ports LCD_nrst_0] [get_bd_pins nt35510_apb_adapter_0/LCD_nrst]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_rd [get_bd_ports LCD_rd_0] [get_bd_pins nt35510_apb_adapter_0/LCD_rd]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_rs [get_bd_ports LCD_rs_0] [get_bd_pins nt35510_apb_adapter_0/LCD_rs]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_wr [get_bd_ports LCD_wr_0] [get_bd_pins nt35510_apb_adapter_0/LCD_wr]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net rst_mig_7series_0_100M_peripheral_aresetn [get_bd_pins altera_up_ps2_0/reset_n] [get_bd_pins axi_apb_bridge_0/s_axi_aresetn] [get_bd_pins axi_apb_bridge_1/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_cfg_spi_0/s_axi4_aresetn] [get_bd_pins axi_cfg_spi_0/s_axi_aresetn] [get_bd_pins axi_ethernetlite_0/s_axi_aresetn] [get_bd_pins axi_intc_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/M02_ARESETN] [get_bd_pins axi_mem_intercon/M03_ARESETN] [get_bd_pins axi_mem_intercon/M04_ARESETN] [get_bd_pins axi_mem_intercon/M05_ARESETN] [get_bd_pins axi_mem_intercon/M06_ARESETN] [get_bd_pins axi_mem_intercon/M07_ARESETN] [get_bd_pins axi_mem_intercon/M09_ARESETN] [get_bd_pins axi_mem_intercon/M10_ARESETN] [get_bd_pins axi_mem_intercon/M11_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_quad_spi_1/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins confreg_0/s00_axi_aresetn] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins nt35510_apb_adapter_0/nrst] [get_bd_pins rst_mig_7series_0_cpu/peripheral_aresetn] [get_bd_pins rst_utmi_clock_0_60M/ext_reset_in] [get_bd_pins system_ila_0/resetn]
  connect_bd_net -net rst_mig_7series_0_cpu_mb_reset [get_bd_pins rst_mig_7series_0_cpu/mb_reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net rst_utmi_clock_0_60M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M08_ARESETN] [get_bd_pins rst_utmi_clock_0_60M/peripheral_aresetn] [get_bd_pins usbh_host_0/aresetn]
  connect_bd_net -net usbh_host_0_intr [get_bd_pins usbh_host_0/intr] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net usbh_host_0_utmi_chrgvbus [get_bd_ports utmi_chrgvbus_0] [get_bd_pins system_ila_1/probe7] [get_bd_pins usbh_host_0/utmi_chrgvbus]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_chrgvbus]
  connect_bd_net -net usbh_host_0_utmi_dischrgvbus [get_bd_ports utmi_dischrgvbus_0] [get_bd_pins system_ila_1/probe8] [get_bd_pins usbh_host_0/utmi_dischrgvbus]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_dischrgvbus]
  connect_bd_net -net usbh_host_0_utmi_dmpulldown [get_bd_ports utmi_dmpulldown_0] [get_bd_pins system_ila_1/probe5] [get_bd_pins usbh_host_0/utmi_dmpulldown]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_dmpulldown]
  connect_bd_net -net usbh_host_0_utmi_dppulldown [get_bd_ports utmi_dppulldown_0] [get_bd_pins system_ila_1/probe2] [get_bd_pins usbh_host_0/utmi_dppulldown]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_dppulldown]
  connect_bd_net -net usbh_host_0_utmi_idpullup [get_bd_ports utmi_idpullup_0] [get_bd_pins system_ila_1/probe6] [get_bd_pins usbh_host_0/utmi_idpullup]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_idpullup]
  connect_bd_net -net usbh_host_0_utmi_opmode [get_bd_ports utmi_opmode_0] [get_bd_pins system_ila_1/probe3] [get_bd_pins usbh_host_0/utmi_opmode]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_opmode]
  connect_bd_net -net usbh_host_0_utmi_reset [get_bd_ports utmi_reset_0] [get_bd_pins usbh_host_0/utmi_reset]
  connect_bd_net -net usbh_host_0_utmi_suspend_n [get_bd_ports utmi_suspend_n_0] [get_bd_pins system_ila_1/probe9] [get_bd_pins usbh_host_0/utmi_suspend_n]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_suspend_n]
  connect_bd_net -net usbh_host_0_utmi_termsel [get_bd_ports utmi_termsel_0] [get_bd_pins system_ila_1/probe1] [get_bd_pins usbh_host_0/utmi_termsel]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_termsel]
  connect_bd_net -net usbh_host_0_utmi_txvalid [get_bd_ports utmi_txvalid_0] [get_bd_pins system_ila_1/probe0] [get_bd_pins usbh_host_0/utmi_txvalid]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_txvalid]
  connect_bd_net -net usbh_host_0_utmi_xcvrsel [get_bd_ports utmi_xcvrsel_0] [get_bd_pins system_ila_1/probe4] [get_bd_pins usbh_host_0/utmi_xcvrsel]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets usbh_host_0_utmi_xcvrsel]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins rst_mig_7series_0_cpu/ext_reset_in] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net utmi_hostdisc_0_1 [get_bd_ports utmi_hostdisc_0] [get_bd_pins system_ila_1/probe13] [get_bd_pins usbh_host_0/utmi_hostdisc]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_hostdisc_0_1]
  connect_bd_net -net utmi_iddig_0_1 [get_bd_ports utmi_iddig_0] [get_bd_pins system_ila_1/probe14] [get_bd_pins usbh_host_0/utmi_iddig]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_iddig_0_1]
  connect_bd_net -net utmi_linestate_0_1 [get_bd_ports utmi_linestate_0] [get_bd_pins system_ila_1/probe11] [get_bd_pins usbh_host_0/utmi_linestate]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_linestate_0_1]
  connect_bd_net -net utmi_rxactive_0_1 [get_bd_ports utmi_rxactive_0] [get_bd_pins system_ila_1/probe16] [get_bd_pins usbh_host_0/utmi_rxactive]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_rxactive_0_1]
  connect_bd_net -net utmi_rxerror_0_1 [get_bd_ports utmi_rxerror_0] [get_bd_pins system_ila_1/probe17] [get_bd_pins usbh_host_0/utmi_rxerror]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_rxerror_0_1]
  connect_bd_net -net utmi_rxvalid_0_1 [get_bd_ports utmi_rxvalid_0] [get_bd_pins system_ila_1/probe12] [get_bd_pins usbh_host_0/utmi_rxvalid]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_rxvalid_0_1]
  connect_bd_net -net utmi_sessend_0_1 [get_bd_ports utmi_sessend_0] [get_bd_pins system_ila_1/probe18] [get_bd_pins usbh_host_0/utmi_sessend]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_sessend_0_1]
  connect_bd_net -net utmi_txready_0_1 [get_bd_ports utmi_txready_0] [get_bd_pins system_ila_1/probe10] [get_bd_pins usbh_host_0/utmi_txready]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_txready_0_1]
  connect_bd_net -net utmi_vbusvalid_0_1 [get_bd_ports utmi_vbusvalid_0] [get_bd_pins system_ila_1/probe15] [get_bd_pins usbh_host_0/utmi_vbusvalid]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets utmi_vbusvalid_0_1]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins util_vector_logic_1/Op2] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axi_intc_0/intr] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins clk_wiz_0/resetn] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_ports LCD_lighton_0] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x1F800000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs altera_up_ps2_0/APB/ctl] SEG_altera_up_ps2_0_ctl
  create_bd_addr_seg -range 0x00002000 -offset 0x1FC00000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x02000000 -offset 0x1C000000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_cfg_spi_0/aximm/MEM0] SEG_axi_cfg_spi_0_MEM0
  create_bd_addr_seg -range 0x00010000 -offset 0x1FA00000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_cfg_spi_0/AXI_LITE/Reg] SEG_axi_cfg_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x1FB00000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_ethernetlite_0/S_AXI/Reg] SEG_axi_ethernetlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x1FE00000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_intc_0/S_AXI/Reg] SEG_axi_intc_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x1F900000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_quad_spi_1/AXI_LITE/Reg] SEG_axi_quad_spi_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x1FD00000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x1F700000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs confreg_0/S00_AXI/S00_AXI_reg] SEG_confreg_0_S00_AXI_reg
  create_bd_addr_seg -range 0x08000000 -offset 0x00000000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00010000 -offset 0x1F600000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs nt35510_apb_adapter_0/APB/Ctrl] SEG_nt35510_apb_adapter_0_Ctrl
  create_bd_addr_seg -range 0x00001000 -offset 0x1E000000 [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs usbh_host_0/cfg/reg0] SEG_usbh_host_0_reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



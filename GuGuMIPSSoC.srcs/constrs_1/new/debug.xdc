create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list utmi_clock_0_IBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/utmi_linestate_0_1[0]} {design_1_i/utmi_linestate_0_1[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[0]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[1]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[2]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[3]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[4]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[5]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[6]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[7]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[8]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[9]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[10]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[11]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[12]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[13]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[14]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[15]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[16]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[17]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[18]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[19]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[20]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[21]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[22]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[23]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[24]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[25]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[26]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[27]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[28]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[29]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[30]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_q[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[0]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[1]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[2]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[3]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[4]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[5]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[6]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[7]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[8]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[9]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[10]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[11]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[12]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[13]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[14]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/c[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[0]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[1]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[2]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[3]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[4]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[5]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[6]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/d[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[0]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[1]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[2]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[3]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[4]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[5]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[6]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[7]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[8]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[9]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[10]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[11]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[12]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[13]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[14]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[15]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[16]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[17]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[18]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[19]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[20]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[21]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[22]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[23]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[24]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[25]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[26]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[27]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[28]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[29]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[30]} {design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_q[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[0]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[1]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[2]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[3]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[4]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[5]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[6]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[7]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[8]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[9]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[10]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[11]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[12]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[13]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[14]} {design_1_i/usbh_host_0/inst/usb_host_inst/u_sie/u_crc16/next_crc[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/utmi_hostdisc_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/utmi_iddig_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/utmi_rxactive_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/utmi_rxerror_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/utmi_rxvalid_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/utmi_sessend_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/utmi_txready_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/utmi_vbusvalid_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list design_1_i/usbh_host_0/inst/usb_host_inst/wr_addr_valid_q]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list design_1_i/usbh_host_0/inst/usb_host_inst/wr_data_valid_q]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets utmi_clock_0_IBUF]

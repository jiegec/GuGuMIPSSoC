set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# clock
set_property PACKAGE_PIN AC19 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

# resetn
set_property PACKAGE_PIN Y3 [get_ports resetn]
set_property IOSTANDARD LVCMOS33 [get_ports resetn]

# uart
set_property PACKAGE_PIN F23 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property PACKAGE_PIN H19 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]
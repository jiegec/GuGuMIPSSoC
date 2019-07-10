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
set_property PACKAGE_PIN H19 [get_ports uart_txd]

set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]

# ethernet mii
set_property PACKAGE_PIN AB21 [get_ports mii_tx_clk]
set_property PACKAGE_PIN AA19 [get_ports mii_rx_clk]
set_property PACKAGE_PIN AA15 [get_ports mii_tx_en]
set_property PACKAGE_PIN AF18 [get_ports {mii_txd[0]}]
set_property PACKAGE_PIN AE18 [get_ports {mii_txd[1]}]
set_property PACKAGE_PIN W15 [get_ports {mii_txd[2]}]
set_property PACKAGE_PIN W14 [get_ports {mii_txd[3]}]
# set_property PACKAGE_PIN AB20 [get_ports mii_tx_er]
set_property PACKAGE_PIN AE22 [get_ports mii_rx_dv]
set_property PACKAGE_PIN V1 [get_ports {mii_rxd[0]}]
set_property PACKAGE_PIN V4 [get_ports {mii_rxd[1]}]
set_property PACKAGE_PIN V2 [get_ports {mii_rxd[2]}]
set_property PACKAGE_PIN V3 [get_ports {mii_rxd[3]}]
set_property PACKAGE_PIN W16 [get_ports mii_rx_er]
set_property PACKAGE_PIN Y15 [get_ports mii_col]
set_property PACKAGE_PIN AF20 [get_ports mii_crs]
set_property PACKAGE_PIN AE26 [get_ports mii_rst_n]

set_property IOSTANDARD LVCMOS33 [get_ports mii_tx_clk]
set_property IOSTANDARD LVCMOS33 [get_ports mii_rx_clk]
set_property IOSTANDARD LVCMOS33 [get_ports mii_tx_en]
set_property IOSTANDARD LVCMOS33 [get_ports {mii_txd[*]}]
# set_property IOSTANDARD LVCMOS33 [get_ports mii_tx_er]
set_property IOSTANDARD LVCMOS33 [get_ports mii_rx_dv]
set_property IOSTANDARD LVCMOS33 [get_ports {mii_rxd[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports mii_rx_er]
set_property IOSTANDARD LVCMOS33 [get_ports mii_col]
set_property IOSTANDARD LVCMOS33 [get_ports mii_crs]
set_property IOSTANDARD LVCMOS33 [get_ports mii_rst_n]

# ethernet mdio
set_property PACKAGE_PIN W3 [get_ports mdio_mdc]
set_property PACKAGE_PIN W1 [get_ports mdio_mdio_io]

set_property IOSTANDARD LVCMOS33 [get_ports mdio_mdc]
set_property IOSTANDARD LVCMOS33 [get_ports mdio_mdio_io]
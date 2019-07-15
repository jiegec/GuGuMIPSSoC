//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Mon Jul 15 10:36:02 2019
//Host        : oslab-Ubuntu16 running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR3_0_addr,
    DDR3_0_ba,
    DDR3_0_cas_n,
    DDR3_0_ck_n,
    DDR3_0_ck_p,
    DDR3_0_cke,
    DDR3_0_dm,
    DDR3_0_dq,
    DDR3_0_dqs_n,
    DDR3_0_dqs_p,
    DDR3_0_odt,
    DDR3_0_ras_n,
    DDR3_0_reset_n,
    DDR3_0_we_n,
    clk,
    mdio_mdc,
    mdio_mdio_io,
    mii_col,
    mii_crs,
    mii_rst_n,
    mii_rx_clk,
    mii_rx_dv,
    mii_rx_er,
    mii_rxd,
    mii_tx_clk,
    mii_tx_en,
    mii_txd,
    resetn,
    uart_rxd,
    uart_txd,
    utmi_data_0,
    utmi_txvalid_0,
    utmi_chrgvbus_0,
    utmi_clock_0,
    utmi_dischrgvbus_0,
    utmi_dmpulldown_0,
    utmi_dppulldown_0,
    utmi_hostdisc_0,
    utmi_iddig_0,
    utmi_idpullup_0,
    utmi_linestate_0,
    utmi_opmode_0,
    utmi_reset_0,
    utmi_rxactive_0,
    utmi_rxerror_0,
    utmi_rxvalid_0,
    utmi_sessend_0,
    utmi_suspend_n_0,
    utmi_termsel_0,
    utmi_txready_0,
    utmi_vbusvalid_0,
    utmi_xcvrsel_0);
  output [12:0]DDR3_0_addr;
  output [2:0]DDR3_0_ba;
  output DDR3_0_cas_n;
  output [0:0]DDR3_0_ck_n;
  output [0:0]DDR3_0_ck_p;
  output [0:0]DDR3_0_cke;
  output [1:0]DDR3_0_dm;
  inout [15:0]DDR3_0_dq;
  inout [1:0]DDR3_0_dqs_n;
  inout [1:0]DDR3_0_dqs_p;
  output [0:0]DDR3_0_odt;
  output DDR3_0_ras_n;
  output DDR3_0_reset_n;
  output DDR3_0_we_n;
  input clk;
  output mdio_mdc;
  inout mdio_mdio_io;
  input mii_col;
  input mii_crs;
  output mii_rst_n;
  input mii_rx_clk;
  input mii_rx_dv;
  input mii_rx_er;
  input [3:0]mii_rxd;
  input mii_tx_clk;
  output mii_tx_en;
  output [3:0]mii_txd;
  input resetn;
  input uart_rxd;
  output uart_txd;
  inout [7:0]utmi_data_0;
  output utmi_txvalid_0;
  output utmi_chrgvbus_0;
  input utmi_clock_0;
  output utmi_dischrgvbus_0;
  output utmi_dmpulldown_0;
  output utmi_dppulldown_0;
  input utmi_hostdisc_0;
  input utmi_iddig_0;
  output utmi_idpullup_0;
  input [1:0]utmi_linestate_0;
  output [1:0]utmi_opmode_0;
  output utmi_reset_0;
  input utmi_rxactive_0;
  input utmi_rxerror_0;
  input utmi_rxvalid_0;
  input utmi_sessend_0;
  output utmi_suspend_n_0;
  output utmi_termsel_0;
  input utmi_txready_0;
  input utmi_vbusvalid_0;
  output [1:0]utmi_xcvrsel_0;

  wire [12:0]DDR3_0_addr;
  wire [2:0]DDR3_0_ba;
  wire DDR3_0_cas_n;
  wire [0:0]DDR3_0_ck_n;
  wire [0:0]DDR3_0_ck_p;
  wire [0:0]DDR3_0_cke;
  wire [1:0]DDR3_0_dm;
  wire [15:0]DDR3_0_dq;
  wire [1:0]DDR3_0_dqs_n;
  wire [1:0]DDR3_0_dqs_p;
  wire [0:0]DDR3_0_odt;
  wire DDR3_0_ras_n;
  wire DDR3_0_reset_n;
  wire DDR3_0_we_n;
  wire clk;
  wire mdio_mdc;
  wire mdio_mdio_i;
  wire mdio_mdio_io;
  wire mdio_mdio_o;
  wire mdio_mdio_t;
  wire mii_col;
  wire mii_crs;
  wire mii_rst_n;
  wire mii_rx_clk;
  wire mii_rx_dv;
  wire mii_rx_er;
  wire [3:0]mii_rxd;
  wire mii_tx_clk;
  wire mii_tx_en;
  wire [3:0]mii_txd;
  wire resetn;
  wire uart_rxd;
  wire uart_txd;
  wire [7:0]utmi_0_data_in;
  wire [7:0]utmi_0_data_out;
  wire utmi_0_txvalid;
  wire utmi_chrgvbus_0;
  wire utmi_clock_0;
  wire utmi_dischrgvbus_0;
  wire utmi_dmpulldown_0;
  wire utmi_dppulldown_0;
  wire utmi_hostdisc_0;
  wire utmi_iddig_0;
  wire utmi_idpullup_0;
  wire [1:0]utmi_linestate_0;
  wire [1:0]utmi_opmode_0;
  wire utmi_reset_0;
  wire utmi_rxactive_0;
  wire utmi_rxerror_0;
  wire utmi_rxvalid_0;
  wire utmi_sessend_0;
  wire utmi_suspend_n_0;
  wire utmi_termsel_0;
  wire utmi_txready_0;
  wire utmi_vbusvalid_0;
  wire [1:0]utmi_xcvrsel_0;

  assign utmi_txvalid_0 = utmi_0_txvalid;

  design_1 design_1_i
       (.DDR3_0_addr(DDR3_0_addr),
        .DDR3_0_ba(DDR3_0_ba),
        .DDR3_0_cas_n(DDR3_0_cas_n),
        .DDR3_0_ck_n(DDR3_0_ck_n),
        .DDR3_0_ck_p(DDR3_0_ck_p),
        .DDR3_0_cke(DDR3_0_cke),
        .DDR3_0_dm(DDR3_0_dm),
        .DDR3_0_dq(DDR3_0_dq),
        .DDR3_0_dqs_n(DDR3_0_dqs_n),
        .DDR3_0_dqs_p(DDR3_0_dqs_p),
        .DDR3_0_odt(DDR3_0_odt),
        .DDR3_0_ras_n(DDR3_0_ras_n),
        .DDR3_0_reset_n(DDR3_0_reset_n),
        .DDR3_0_we_n(DDR3_0_we_n),
        .clk(clk),
        .mdio_mdc(mdio_mdc),
        .mdio_mdio_i(mdio_mdio_i),
        .mdio_mdio_o(mdio_mdio_o),
        .mdio_mdio_t(mdio_mdio_t),
        .mii_col(mii_col),
        .mii_crs(mii_crs),
        .mii_rst_n(mii_rst_n),
        .mii_rx_clk(mii_rx_clk),
        .mii_rx_dv(mii_rx_dv),
        .mii_rx_er(mii_rx_er),
        .mii_rxd(mii_rxd),
        .mii_tx_clk(mii_tx_clk),
        .mii_tx_en(mii_tx_en),
        .mii_txd(mii_txd),
        .resetn(resetn),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd),
        .utmi_0_data_in(utmi_0_data_in),
        .utmi_0_data_out(utmi_0_data_out),
        .utmi_0_txvalid(utmi_0_txvalid),
        .utmi_chrgvbus_0(utmi_chrgvbus_0),
        .utmi_clock_0(utmi_clock_0),
        .utmi_dischrgvbus_0(utmi_dischrgvbus_0),
        .utmi_dmpulldown_0(utmi_dmpulldown_0),
        .utmi_dppulldown_0(utmi_dppulldown_0),
        .utmi_hostdisc_0(utmi_hostdisc_0),
        .utmi_iddig_0(utmi_iddig_0),
        .utmi_idpullup_0(utmi_idpullup_0),
        .utmi_linestate_0(utmi_linestate_0),
        .utmi_opmode_0(utmi_opmode_0),
        .utmi_reset_0(utmi_reset_0),
        .utmi_rxactive_0(utmi_rxactive_0),
        .utmi_rxerror_0(utmi_rxerror_0),
        .utmi_rxvalid_0(utmi_rxvalid_0),
        .utmi_sessend_0(utmi_sessend_0),
        .utmi_suspend_n_0(utmi_suspend_n_0),
        .utmi_termsel_0(utmi_termsel_0),
        .utmi_txready_0(utmi_txready_0),
        .utmi_vbusvalid_0(utmi_vbusvalid_0),
        .utmi_xcvrsel_0(utmi_xcvrsel_0));
  IOBUF mdio_mdio_iobuf
       (.I(mdio_mdio_o),
        .IO(mdio_mdio_io),
        .O(mdio_mdio_i),
        .T(mdio_mdio_t));
  generate
    genvar i;
    for (i = 0;i < 8;i = i + 1) begin
      IOBUF utmi_iobuf
       (.I(utmi_0_data_out[i]),
        .IO(utmi_data_0[i]),
        .O(utmi_0_data_in[i]),
        .T(utmi_0_txvalid));
    end
  endgenerate
endmodule

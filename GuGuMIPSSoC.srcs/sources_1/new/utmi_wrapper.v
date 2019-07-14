`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2019 01:25:02 PM
// Design Name: 
// Module Name: utmi_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module utmi_wrapper(
    // ULPI (SIE)
    output ulpi_clock,
    output [7:0] ulpi_data_o,
    input [7:0] ulpi_data_i,
    input ulpi_data_t,
    output ulpi_dir,
    output ulpi_next,
    input ulpi_reset,
    input ulpi_stop,

    // UTMI+ Level 3 (PHY)
    output utmi_reset,
    input utmi_clock,

    inout [7:0] utmi_data,
    output utmi_txvalid,
    input utmi_txready,
    input utmi_rxactive,
    input utmi_rxvalid,
    input utmi_rxerror,

    output utmi_suspend_n,
    output [1:0] utmi_xcvrsel,
    output utmi_termsel,
    output [1:0] utmi_opmode,
    input [1:0] utmi_linestate,

    input utmi_hostdisc,
    output utmi_idpullup,
    input utmi_iddig,
    output utmi_dppulldown,
    output utmi_dmpulldown,
    output utmi_chrgvbus,
    output utmi_dischrgvbus,
    input utmi_vbusvalid,
    input utmi_sessend
);

    assign ulpi_clock = utmi_clock;
    assign utmi_reset = ulpi_reset;

    assign ulpi_data_o = 0;
    assign ulpi_dir = 0;
    assign ulpi_next = 0;
endmodule

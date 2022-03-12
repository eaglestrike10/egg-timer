`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 03/25/2020 04:05:34 PM
// Design Name: 
// Module Name: multiClk_main
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


module multiClk_main(
    input clk,
    output clk_1Hz, clk_5MHz
    );
    wire clk5MHz;
    clk_div_1Hz(.clk_in(clk5MHz), .clk_out(clk_1Hz));
    clk_wiz_5MHz(.clk_in1(clk), .clk_out1(clk_5MHz));
endmodule

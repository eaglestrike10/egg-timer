`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 03/26/2020 10:03:50 AM
// Design Name: 
// Module Name: gateMain
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


module gateMain(
    input clk, enable,
    output g_clk
    );
    wire enSafe;
    transLatch latch(.clk(clk), .D(enable), .Q(enSafe));
    and and1(g_clk, enSafe, clk);
endmodule

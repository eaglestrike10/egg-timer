`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 03/25/2020 04:38:22 PM
// Design Name: 
// Module Name: timerOn
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


module timerOn(
    input clk_in,
    output reg led_out
    );
    initial led_out = 0;
    always@(posedge clk_in) led_out = ~led_out;
endmodule

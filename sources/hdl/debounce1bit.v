`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 03/25/2020 04:23:38 PM
// Design Name: 
// Module Name: debounce1bit
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


module debounce1bit(
    input clk, sig, rst,
    output debounceSig
    );
    
    wire [1:0]intercon;
    DFlipFlop ff1(.clk(clk), .reset(rst), .D(sig), .Q(intercon[0]));
    DFlipFlop ff2(.clk(clk), .reset(rst), .D(intercon[0]), .Q(intercon[1]));
    assign debounceSig = &intercon;
endmodule

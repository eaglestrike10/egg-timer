`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 03/21/2020 06:20:13 PM
// Design Name: 
// Module Name: driverMain
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


module driverMain(
        input clk, 
        input [3:0] v0, v1, v2, v3, v4, v5, v6, v7,
        output [6:0] segData,
        output [7:0] anSignal
    );
    wire [3:0]bcdCon;
    wire [2:0]plexerSig;
    PlexerSignal segDriver(.CLK(clk), .Q(plexerSig)); //A 3 bit binary counter IP which counts up with a max count of 8
    mux4bit8to1 BCDPlexer(.a(v0), .b(v1), .c(v2), .d(v3), .e(v4), .f(v5), .g(v6), .h(v7), .s(plexerSig), .z(bcdCon));
    mux8bit8to1 anPlexer(.a(8'b11111110), .b(8'b11111101), .c(8'b11111011), .d(8'b11110111), .e(8'b11101111), .f(8'b11011111), .g(8'b10111111), .h(8'b01111111), .s(plexerSig), .z(anSignal));
    BCDtoSeg segDecoder(.v(bcdCon), .seg(segData));
endmodule

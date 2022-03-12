`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi 
// 
// Create Date: 03/21/2020 03:32:03 PM
// Design Name: 
// Module Name: BCDtoSeg
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


module BCDtoSeg(
    input [3:0]v,
    output reg [6:0]seg
    );
    always@(v)
        case(v)
            4'b0000 : seg = 7'b1000000;
            4'b0001 : seg = 7'b1111001;
            4'b0010 : seg = 7'b0100100;
            4'b0011 : seg = 7'b0110000;
            4'b0100 : seg = 7'b0011001;
            4'b0101 : seg = 7'b0010010;
            4'b0110 : seg = 7'b0000010;
            4'b0111 : seg = 7'b1111000;
            4'b1000 : seg = 7'b0000000;
            4'b1001 : seg = 7'b0010000;
            4'b1111 : seg = 7'b0111111;
            default : seg = 7'b1111111;
        endcase
endmodule

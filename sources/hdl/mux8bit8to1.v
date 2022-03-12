`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi 
// 
// Create Date: 03/21/2020 03:13:22 PM
// Design Name: 
// Module Name: mux8bit8to1
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


module mux8bit8to1(
    input [7:0] a, b, c, d, e, f, g, h,
    input [2:0] s,
    output reg [7:0] z
);
    always@(a or b or c or d or e or f or g or h or s) begin      
        case(s)
            3'b000: z = a;
            3'b001: z = b;
            3'b010: z = c;
            3'b011: z = d;
            3'b100: z = e;
            3'b101: z = f;
            3'b110: z = g;
            3'b111: z = h;
            default: z = 7'bxxxxxxx;
        endcase
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 04/05/2020 02:40:30 PM
// Design Name: 
// Module Name: muxMain
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


module muxMain(
    input [5:0] min1, min2, sec1, sec2,
    input sel,
    output reg[5:0] min_out, sec_out
    );
    
    always@(min1 or min2 or sec1 or sec2 or sel) begin
        if(sel) begin
            min_out <= min2;
            sec_out <= sec2;
        end else begin
            min_out <= min1;
            sec_out <= sec1;
        end
    end
endmodule

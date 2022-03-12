`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 04/02/2020 02:30:10 PM
// Design Name: 
// Module Name: CounterV2
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


module CounterV2#(parameter COUNT_TOP = 59, BIT_WIDTH = 6, THRESHOLD = 59)(
        input clk, load, reset,
        input [BIT_WIDTH-1:0]loadVal,
        output [BIT_WIDTH-1:0]Q,
        output OVF
    );
    reg [BIT_WIDTH-1:0] count;
    reg overflow;
    always@(posedge clk or posedge load or posedge reset)begin
        if(reset) count <= 0;
        else if(load) count <= loadVal;
        else begin
            if(~|count) count <= COUNT_TOP;
            else count <= count - 1;
        end
    end
    
    always@(count)begin
        if(count == THRESHOLD) overflow <= 1;
        else overflow <= 0;
    end
    
    assign Q = count;
    assign OVF = overflow;
endmodule

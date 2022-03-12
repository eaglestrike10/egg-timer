`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
//////////////////////////////////////////////////////////////////////////////////

module transLatch(
    input D, clk,
    output reg Q
    );
    wire clkIn;
    assign clkIn = ~clk;
    always@(clkIn or D) begin
        if(clkIn) Q <= D;
    end
    
endmodule
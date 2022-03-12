`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
//
// Divides the clk_in signal by HALF_PERIOD to produce a stepped down clk_out signal
// Change HALF_PERIOD using defparam in top module
//////////////////////////////////////////////////////////////////////


module clk_div(
    input clk_in,
    output reg clk_out
    );
    
integer counter;
parameter HALF_PERIOD = 100;
always@(posedge clk_in)
    if(counter < HALF_PERIOD - 1) counter = counter + 1;
    else begin
    clk_out = ~clk_out;
    counter = 0;
    end
endmodule

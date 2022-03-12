`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
//
// Create Date: 04/02/2020 02:55:29 PM
// Design Name: 
// Module Name: CountTimeMain
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


module CountTimeMain(
    input loadMin, loadSec, clk_1Hz, enable, reset,
    input [5:0] valMin, valSec,
    output [5:0] min, sec
    );
    
    wire secDone, minDone, gclk_1Hz, done, secOvf;
    assign secDone = ~|sec;
    assign minDone = ~|min;
    assign done = secDone & minDone;
    gateMain_0 enGate(.clk(clk_1Hz), .enable(enable & ~done), .g_clk(gclk_1Hz));
    CounterV2_0 secCount(.clk(gclk_1Hz), .reset(reset), .load(loadSec), .loadVal(valSec), .OVF(secOvf), .Q(sec));
    CounterV2_0 minCount(.clk(secOvf), .reset(reset), .load(loadMin), .loadVal(valMin), .OVF(), .Q(min));
    
endmodule

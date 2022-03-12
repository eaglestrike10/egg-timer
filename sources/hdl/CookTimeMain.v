`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University
// Engineering Student: Sunao Gomi
// 
// Create Date: 04/05/2020 12:12:56 PM
// Design Name: 
// Module Name: CookTimeMain
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


module CookTimeMain#(parameter MAX_MIN = 5)(
    input enable, min, sec, reset,
    output [5:0] minutes, seconds
    );
    reg [5:0] setMin, setSec;
    

    
    always@(min or sec or reset) begin
        if(reset) begin
            setMin <= 0;
            setSec <= 0;
        end else if(enable) begin
            if(min) begin
                if(min < MAX_MIN) setMin <= setMin + 1;
                else setMin <= 0;
            end
            if(sec) begin
                if(sec < 55) setSec <= setSec + 5;
                else begin
                    setSec <= 0;
                    if(min < MAX_MIN) setMin <= setMin + 1;
                    else setMin <= 0;
                end
            end
        end
    end
    
    assign minutes = setMin;
    assign seconds = setSec;
endmodule

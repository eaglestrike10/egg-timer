`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Carleton University 
// Engineering Student: Sunao Gomi
// 
// Create Date: 03/21/2020 09:45:28 PM
// Design Name: 
// Module Name: bcdEncoder
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
// Algorithm for BCD encoding from: https://my.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
// 1.If any column (100's, 10's, 1's, etc.) is 5 or greater, add 3 to that column.
// 2.Shift all #'s to the left 1 position.
// 3.If 8 shifts have been performed, it's done! Evaluate each column for the BCD values.
// 4.Go to step 1. 
// 
//////////////////////////////////////////////////////////////////////////////////


module bcdEncoder(
    input [31:0] b_in,
    output reg [3:0] BCD0, BCD1, BCD2, BCD3, BCD4, BCD5, BCD6, BCD7, BCD8, BCD9
);
    integer i;
    always@(b_in) begin
        //initialize all outputs
        BCD0 = 4'b0;
        BCD1 = 4'b0;
        BCD2 = 4'b0;
        BCD3 = 4'b0;
        BCD4 = 4'b0;
        BCD5 = 4'b0;
        BCD6 = 4'b0;
        BCD7 = 4'b0;
        BCD8 = 4'b0;
        BCD9 = 4'b0;
        
        //step 3/4 conditions
        for(i = 31; i >= 0; i = i-1) begin
           //check condition 1
           if(BCD9 >= 5) BCD9 = BCD9 + 3; 
           if(BCD8 >= 5) BCD8 = BCD8 + 3; 
           if(BCD7 >= 5) BCD7 = BCD7 + 3; 
           if(BCD6 >= 5) BCD6 = BCD6 + 3; 
           if(BCD5 >= 5) BCD5 = BCD5 + 3; 
           if(BCD4 >= 5) BCD4 = BCD4 + 3; 
           if(BCD3 >= 5) BCD3 = BCD3 + 3; 
           if(BCD2 >= 5) BCD2 = BCD2 + 3; 
           if(BCD1 >= 5) BCD1 = BCD1 + 3;
           if(BCD0 >= 5) BCD0 = BCD0 + 3; 
            
           // step 2: Shifting
           BCD9 = BCD9<<1;
           BCD9[0] = BCD8[3];
           BCD8 = BCD8<<1;
           BCD8[0] = BCD7[3];
           BCD7 = BCD7<<1;
           BCD7[0] = BCD6[3];
           BCD6 = BCD6<<1;
           BCD6[0] = BCD5[3];
           BCD5 = BCD5<<1;
           BCD5[0] = BCD4[3];
           BCD4 = BCD4<<1;
           BCD4[0] = BCD3[3];
           BCD3 = BCD3<<1;
           BCD3[0] = BCD2[3];
           BCD2 = BCD2<<1;
           BCD2[0] = BCD1[3];
           BCD1 = BCD1<<1;
           BCD1[0] = BCD0[3];
           BCD0 = BCD0<<1;
           //shift in from the 32-bit input
           BCD0[0] = b_in[i];
        end
    end
endmodule

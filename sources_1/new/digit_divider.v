`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 13:45:25
// Design Name: 
// Module Name: digit_divider
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


module digit_divider(
    input [5:0] i_a, i_b,
    output [3:0] o_four, o_three, o_two, o_one
    );

    assign o_four = i_a/10%10;
    assign o_three = i_a%10;
    assign o_two = i_b/10%10;
    assign o_one = i_b%10;
endmodule

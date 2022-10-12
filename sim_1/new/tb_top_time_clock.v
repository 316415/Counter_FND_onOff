`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 14:50:12
// Design Name: 
// Module Name: tb_top_time_clock
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


module tb_top_time_clock();

    reg i_clk, i_reset, i_mode;
    wire [7:0] o_font;
    wire [3:0] o_digit;

    top_time_clock dut(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_mode(i_mode),
        .o_font(o_font),
        .o_digit(o_digit)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        #00 i_reset = 1'b0; i_mode = 1'b0;
        #200 i_reset = 1'b0; i_mode = 1'b1;
        #200 i_reset = 1'b0; i_mode = 1'b0;
        #10 i_reset = 1'b1; i_mode = 1'b0;
        #100 i_reset = 1'b0; i_mode = 1'b0;
        #100 $finish;
    end
endmodule

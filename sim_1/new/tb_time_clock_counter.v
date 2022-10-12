`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 11:31:34
// Design Name: 
// Module Name: tb_time_clock_counter
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


module tb_time_clock_counter();

    reg i_clk = 0, i_reset = 0;
    wire [5:0] o_hour, o_min, o_sec;
    wire [6:0] o_ms;

    time_clock_counter udt(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_hour(o_hour),
        .o_min(o_min),
        .o_sec(o_sec),
        .o_ms(o_ms)
    );

    always #5000 i_clk = ~i_clk;

    initial begin
        #00 i_reset = 1'b0;
        #2000 i_reset = 1'b1;
        #100 i_reset = 1'b0;
        #100 $finish;
    end
endmodule







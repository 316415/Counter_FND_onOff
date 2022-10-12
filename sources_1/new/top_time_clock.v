`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 13:29:50
// Design Name: 
// Module Name: top_time_clock
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


module top_time_clock(
    input i_clk, i_reset, i_mode, i_onOff,
    output [7:0] o_font,
    output [3:0] o_digit
    );

    wire w_clk;
    wire [2:0] w_fndCounter;
    wire [5:0] w_hour, w_min, w_sec;
    wire [6:0] w_ms;
    wire [3:0] w_four, w_three, w_two, w_one, w_hour_min, w_four_s, w_three_s, w_two_s, w_one_s, w_sec_ms, w_value;

    clock_divider clk_div(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    counter_fnd cnt_fnd(
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_counter(w_fndCounter)
    );

    DecoderFndDigit fnd_decoder(
        .i_select(w_fndCounter),
        .o_digitPosition(o_digit)
    );

    time_clock_counter time_cnt(
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_hour(w_hour),
        .o_min(w_min),
        .o_sec(w_sec),
        .o_ms(w_ms)
    );

    digit_divider hour_min_div(
        .i_a(w_hour),
        .i_b(w_min),
        .o_four(w_four),
        .o_three(w_three),
        .o_two(w_two),
        .o_one(w_one)
    );

    wire [3:0] w_fndDP;
    
    comparator cmp(
        .i_ms(w_ms),
        .o_fndDP(w_fndDP)
    );

    Mux_8x1 hour_min(
        .i_a(w_one),
        .i_b(w_two),
        .i_c(w_three),
        .i_d(w_four),
        .i_a1(11),
        .i_b1(11),
        .i_c1(w_fndDP),
        .i_d1(11),
        .i_sel(w_fndCounter),
        .o_y(w_hour_min)
    );

    digit_divider_sec sec_div(
        .i_a(w_sec),
        .i_b(w_ms),
        .o_four(w_four_s),
        .o_three(w_three_s),
        .o_two(w_two_s),
        .o_one(w_one_s)
    );

    Mux_8x1 sec(
        .i_a(w_one_s),
        .i_b(w_two_s),
        .i_c(w_three_s),
        .i_d(w_four_s),
        .i_a1(11),
        .i_b1(11),
        .i_c1(w_fndDP),
        .i_d1(11),
        .i_sel(w_fndCounter),
        .o_y(w_sec_ms)
    );

    Mux_2x1 hour_sec_mode(
        .i_onOff(i_onOff),
        .i_a(w_hour_min),
        .i_b(w_sec_ms),
        .i_mode(i_mode),
        .o_y(w_value)
    );

    BCDtoFND_decoder BCD(
        .i_value(w_value),
        .o_font(o_font)
    );
endmodule

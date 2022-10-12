`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 13:21:48
// Design Name: 
// Module Name: Mux_2x1
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


module Mux_2x1(
    input [3:0] i_a, i_b,
    input i_mode, i_onOff,
    output [3:0] o_y
    );

    reg [3:0] r_y;
    assign o_y = r_y;

    always @(*) begin
        if(i_onOff) begin
            r_y = 8'hff;
        end
        else begin
            case (i_mode)
                1'b0 : r_y <= i_a;
                1'b1 : r_y <= i_b; 
            endcase
        end
    end
endmodule

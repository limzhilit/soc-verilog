`timescale 1ns / 1ps
// D flip-flop with asynchronous reset
// Michelle Lynch

module DFF(
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
    );

always @(posedge clk, negedge rst)// always looking for changes in clk & rst 
    if(~rst)
        q <= 1'b0; //one bit wide, set to zero 
    else
        q <= d;

endmodule


`timescale 1ns / 1ps
// 2-Bit Adder with registered outputs
// Zhi Lit Lim

module Adder2BitReg(
    input a,
    input b,
    input clk,
    input rst_n,
    output s,
    output c
    );
    
    reg s_reg, c_reg;
    wire s_next, c_next;

    assign s_next = a ^ b;
    assign c_next = a & b;
    
    
    always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        s_reg <= 1'b0; // assign to 0
        c_reg <= 1'b0;
    end
    else begin
        s_reg <= s_next; // assign
        c_reg <= c_next;
    end
    end
    
    assign s = s_reg;
    assign c = c_reg;



    
    
endmodule

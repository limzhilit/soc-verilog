`timescale 1ns / 1ps
// Testbench.v
// Michelle Lynch

module Testbench;
    
  // Internal testbench signals
  reg a, b;
  reg clk, rst_n;
  wire s, c; 
  localparam T = 20;
  
  // Instantiate the Unit Under Test (uut)
  Adder2BitReg uut(
  .a(a), 
  .b(b), 
  .clk(clk), 
  .rst_n(rst_n), 
  .s(s), 
  .c(c)
  );
    
  // Clock
  always
  begin
    // Add code
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
  end
  
  // Reset
  initial
  begin
    rst_n = 1'b1;
    repeat (2) begin
        @(negedge clk);
    end
    rst_n = 1'b0;
    repeat (10) begin
        @(negedge clk);
    end
    rst_n = 1'b1;
  end
  
  // Data
  initial 
  begin
  $display("\n 2 Bit Adder with Registers Test\n");
  a = 1'b1; b = 1'b1;
  // Add code
  #20
  a = 1'b0; b = 1'b1;
  #30
  a = 1'b1; b = 1'b0;
  #40
  $stop;
  end
    
endmodule

`timescale 1ns / 1ps

// File: Testbench.v
// Author: Michelle Lynch
// Copyright Michelle Lynch 2024

module Testbench;

parameter HDISP = 6;
parameter VDISP = 2;
parameter HFP = 1; // horizontal front porch (blank interval)
parameter VFP = 1;
parameter HPW = 1; // horizontal pulse width, synchronise
parameter VPW = 1;
parameter HLIM = 10; // horizontal limit, max before reset
parameter VLIM = 6;
parameter COUNTER_WIDTH = 3; // unused 
parameter COUNT_FROM = 0; // unused 
parameter COUNT_TO = 3; // unused 
parameter COUNT_RESET = 3; // unused 
parameter T = 10; // 10 ns

reg clk, rst; // hold assigned value
wire hsync, vsync, vid_on; // connect signal
wire [10:0] row, col;
wire [3:0] red, green, blue;

VGASync #(.HDISP(HDISP), .VDISP(VDISP), .HFP(HFP), .VFP(VFP),
          .HPW(HPW), .VPW(VPW), .HLIM(HLIM), .VLIM(VLIM)) i_VGASync 
         (.clk25(clk), .rst(rst), .hsync(hsync), .vsync(vsync), 
          .vid_on(vid_on), .row(row), .col(col));

ColourStripes #(.COUNTER_WIDTH(COUNTER_WIDTH), .COUNT_TO(COUNT_TO),
              .COUNT_FROM(COUNT_FROM), .COUNT_RESET(COUNT_RESET)) i_colour_stripes
    (.clk(clk), .rst(rst), .row(row), .col(col), .red(red), .green(green), .blue(blue));
   
// TB Clock
always begin
    clk = 1'b0; // low 
    #(T/2);
    clk = 1'b1; // high
    #(T/2);
end

// TB Reset
initial begin
    rst = 1'b1;
    repeat(2) begin
        @(negedge clk); // at negative edge of clock
    end
    rst = 1'b0; 
end
endmodule

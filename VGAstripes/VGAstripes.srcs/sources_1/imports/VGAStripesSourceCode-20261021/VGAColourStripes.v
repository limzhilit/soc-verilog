`timescale 1ns / 1ps

// File: VGAColourStripes.v
// Author: Michelle Lynch
// Copyright Michelle Lynch 2024
//
// Adapting Author: Zhi Lit Lim 
// Date: 

module ColourStripes #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 26,
    parameter COUNT_RESET = 32'b1 << 27)
    (input clk, rst,
     input [10:0] row, col, 
     output [3:0] red, green, blue);

reg [3:0] red_reg, green_reg, blue_reg, red_next, green_next, blue_next;

//reg [5:0] offset;
//reg [23:0] speed_counter;

//always @(posedge clk or posedge rst) begin
//    if (rst) begin
//        offset <= 6'd0;
//        speed_counter <= 24'd0;
//    end
//    else begin
//        if (speed_counter >= 24'd1_000_000) begin
//            speed_counter <= 24'd0;

//            if (offset == 6'd39)
//                offset <= 6'd0;
//            else
//                offset <= offset + 1'b1;
//        end
//        else begin
//            speed_counter <= speed_counter + 1'b1;
//        end
//    end
//end


//// Next state & output logic state  machine 
//always@* begin
//    if ((((row + offset) / 40) ^ ((col + offset) / 40)) & 1'b1) begin      
//      red_next   <= 4'b0101;
//      green_next <= 4'b1010;
//      blue_next  <= 4'b0000;
//   end
//   else begin
//      red_next   <= 4'b1111;
//      green_next <= 4'b0101;
//      blue_next  <= 4'b1010;
//   end
//end

integer dx, dy;
integer eye_dx, eye_dy;
integer distance_squared;

always @* begin

    // Default background: black
    red_next   = 4'b0000;
    green_next = 4'b0000;
    blue_next  = 4'b0000;

    // Calculate distance from centre of face
    dx = $signed({1'b0, col}) - 320;
    dy = $signed({1'b0, row}) - 240;

    distance_squared = dx * dx + dy * dy;

    // Yellow circular face (radius 100)
    if (distance_squared <= 10000) begin

        red_next   = 4'b1111;
        green_next = 4'b1111;
        blue_next  = 4'b0000;

        // Left eye (centre: 285, 210)
        eye_dx = $signed({1'b0, col}) - 285;
        eye_dy = $signed({1'b0, row}) - 210;

        if ((eye_dx * eye_dx + eye_dy * eye_dy) <= 36) begin
            red_next   = 4'b0000;
            green_next = 4'b0000;
            blue_next  = 4'b0000;
        end

        // Right eye (centre: 355, 210)
        eye_dx = $signed({1'b0, col}) - 355;
        eye_dy = $signed({1'b0, row}) - 210;

        if ((eye_dx * eye_dx + eye_dy * eye_dy) <= 36) begin
            red_next   = 4'b0000;
            green_next = 4'b0000;
            blue_next  = 4'b0000;
        end

        // Smiling mouth (lower half of annulus)
        if ((distance_squared >= 4200) &&
            (distance_squared <= 4900) &&
            (row >= 240)) begin

            red_next   = 4'b0000;
            green_next = 4'b0000;
            blue_next  = 4'b0000;
        end

    end
end


// Register RGB outputs    
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        red_reg   <= 4'b0000;
        green_reg <= 4'b0000;
        blue_reg  <= 4'b0000;
    end
    else begin
        red_reg   <= red_next;
        green_reg <= green_next;
        blue_reg  <= blue_next;
    end
end

// Assign output wires
assign red = red_reg;
assign green = green_reg;
assign blue = blue_reg;

endmodule
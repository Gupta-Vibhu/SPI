`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Vibhu Gupta
// 
// Create Date: 17.08.2024 00:57:46
// Design Name: SPI
// Module Name: top
// Project Name: CDAC Mini Project
// Target Devices: Digilent Basys 3
// Tool Versions: Vivado 2023.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top( 
            input clk,
            input cs_in,
            input reset_n,
            input data_in,
            //input miso,
            output [7:0] dout_slave,
            output [7:0] dout_master
            );
                
wire sclk,mosi,cs,miso;


SPI_master m1(
            .clk(clk),
            .cs_in(cs_in),
            .reset_n(reset_n),
            .miso(miso),
            .sclk(sclk),
            .mosi(mosi),
            .cs(cs),
            .data_in(data_in),
            .data_out(dout_master)
            );
                
SPI_slave s1(
            .sclk(sclk),
            .mosi(mosi),
            .cs(cs),
            .i_reset_n(reset_n),
            .dout(dout_slave),
            .miso(miso) 
            );

endmodule


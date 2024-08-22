`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2024 20:31:26
// Design Name: 
// Module Name: top
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


spi_master m1(
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
                
spi_slave s1(
            .sclk(sclk),
            .mosi(mosi),
            .cs(cs),
            .i_reset_n(reset_n),
            .dout(dout_slave),
            .miso(miso) 
            );

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Vibhu Gupta
// 
// Create Date: 17.08.2024 00:57:46
// Design Name: SPI
// Module Name: basys3_wrapper
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


module tb_slave();
reg sclk, mosi,cs, i_reset_n;
wire [7:0] dout;
wire miso;

SPI_slave s1(
            .sclk(sclk),
            .mosi(mosi),
            .cs(cs),
            .i_reset_n(i_reset_n),
            .dout(dout),
            .miso(miso)
            );

always #5 sclk = ~sclk;
always #300 cs = ~cs;

initial begin
    i_reset_n = 1'b0;
    sclk = 'b0;
    cs = 1;
    #6 i_reset_n = 1;
    #9 cs = 0;
end

initial fork
    mosi = 0;
    #20 mosi = 1'b1;
    #30 mosi = 1'b0;
    #40 mosi = 1'b1;
    #50 mosi = 1'b0;
    #60 mosi = 1'b1;
    #70 mosi = 1'b0;
    #80 mosi = 1'b1;
    #90 mosi = 1'b0;
    #100 mosi = 1'b0;
    #110 mosi = 1'b1;
    #120 mosi = 1'b1;
    #130 mosi =1'b0;
    #140 mosi = 1'b1;
    #150 mosi =  1'b1;
    #160 mosi =1'b0;
    #170 mosi = 1'b1;
    #180 mosi =1'b0;
    #190 mosi = 1'b1;
    #200 mosi = 1'b1;
    #210 mosi = 1'b0;
    #220 mosi = 1'b0;
    #230 mosi = 1'b1;
    #240 mosi = 1'b0;
    
    #1000 $finish();
join

endmodule

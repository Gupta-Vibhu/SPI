`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Vibhu Gupta
// 
// Create Date: 17.08.2024 00:57:46
// Design Name: SPI
// Module Name: tb_top
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

module tb_top();
reg clk;
reg cs_in;
reg reset_n;
reg data_in;
//reg miso;
wire [7:0] dout_master;
wire [7:0] dout_slave;

always#5 clk=~clk;

initial fork
    clk='b0;
    reset_n='b0;
    cs_in = 'b1;
    #10 cs_in = 'b0;
    #4 reset_n='b1;
join

initial fork
    #20 data_in = 0;
    #110 data_in = 1'b0;
    #200 data_in = 1'b0;
    #290 data_in = 1'b1;
    #380 data_in = 1'b1;
    #470 data_in = 1'b0;
    #560 data_in = 1'b1;
    #650 data_in = 1'b1;
    #740 data_in = 1'b0;
    #830 data_in = 1'b1;
    #920 data_in = 1'b1;
    #5000 $finish();
join

top dut(
        .clk(clk),
        .cs_in(cs_in),
        .reset_n(reset_n),
        .data_in(data_in),
        .dout_slave(dout_slave),
        .dout_master(dout_master)
        );
         
endmodule


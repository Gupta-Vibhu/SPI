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


module tb_piso_1();

// Testbench signals

    reg [8:0] sw;
    reg clk;
    reg reset_n;
    wire out;

 piso_1 dut(.sw(sw), .clk(clk), .reset_n(reset_n), .out(out));

always #5 clk = ~clk;

initial begin
    clk = 1'b0;
    reset_n = 1'b0;
    #10000 $finish();
end 

initial fork
 
    #10 sw[0] = 1'b0;
    #12 sw[1] = 1'b1;
    #14 sw[2] = 1'b0;
    #16 sw[3] = 1'b0;
    #18 sw[4] = 1'b1;
    #20 sw[5] = 1'b1;
    #22 sw[6] = 1'b1;
    #24 sw[7] = 1'b0;
    #26 sw[8] = 1'b1;
    #28 reset_n = ~reset_n;
 join
 
endmodule

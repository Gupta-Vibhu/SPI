`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: Vibhu Gupta
// 
// Create Date: 17.08.2024 00:57:46
// Design Name: SPI
// Module Name: SPI_slave
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

//README:
//---> count variable is to count the no. of bits of the frame.
//---> read_flag is the first bit of the data frame.
//---> read_flag = 0 for write into slave by mosi line.
//---> read_flag = 1 for read through slave, by sending data to master, on miso line.

module SPI_slave(
                input sclk, mosi,cs,i_reset_n,
                output reg [7:0] dout,
                output reg miso
               );
               
integer count_slave;             
reg  read_flag_slave;

//FOR COUNT ------>COUNTER FOR BITS OF DATA FRAME 

always @(posedge sclk,negedge i_reset_n) begin
    if(!i_reset_n)
        count_slave <= 0;
    else if(!cs && count_slave == 8) 
            count_slave <= 0;
        else
            count_slave <= count_slave + 1;           
    end

//to sample read_flag
 
always @(posedge sclk,negedge i_reset_n) begin
   if(!i_reset_n)
        read_flag_slave <= 1;
   else if(!cs && (count_slave == 0)) 
        read_flag_slave <= mosi;  
 end
 
//to write in slave

always @(posedge sclk) begin
   if(!cs && (read_flag_slave==0) && (count_slave > 0) && (count_slave <= 8))
            dout <= {mosi,dout[7:1]};        //right shift register 
 end  

//to drive MISO

always @(posedge sclk) begin
   if(!cs && read_flag_slave && (count_slave > 0) && (count_slave <= 8))
        miso <= dout[count_slave - 1]; 
end

endmodule



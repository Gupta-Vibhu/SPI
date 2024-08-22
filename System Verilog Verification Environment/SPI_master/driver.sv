// driver.sv

`include "transaction.sv"

class driver;
    
    int count;
   
    virtual inf vif;
    mailbox gen2drv;
    transaction tr;

    function new(mailbox gen2drv, virtual inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    // task reset();
    //     wait(!vif.reset_n);
    //     $display("--------------Reset started-----------------");
    //     vif.cs_in <= 0;
    //     vif.data_in <= 0;
    //     vif.miso <= 0;
    // endtask : reset

    task main();
        forever begin
            gen2drv.get(tr);
            // repeat(8)
            @(posedge vif.clk);
            vif.cs_in <= tr.cs_in;
            vif.data_in <= tr.data_in;

            repeat(8) begin
             @(posedge vif.clk);
            vif.miso <= tr.miso;
            end

            count++;            
             // tr.sclk = vif.sclk;
             // tr.mosi = vif.mosi;
             // tr.cs = vif.cs;
             // tr.data_out = vif.data_out;
            tr.display("DRIVER");
        end
    endtask : main
endclass : driver

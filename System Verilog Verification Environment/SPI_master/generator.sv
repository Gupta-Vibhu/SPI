// generator.sv

`include "transaction.sv"

class generator;
    
    transaction tr;

    int count; //transaction packet count

    mailbox gen2drv;
    event ended;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task main();
        
        repeat(count) begin  
            tr = new();
            tr.randomize();
            tr.display("GENERATOR");
            gen2drv.put(tr);
        end
        ->ended;
    endtask
endclass : generator

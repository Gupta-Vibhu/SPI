// // scoreboard.sv
// `include "transaction.sv"

// class scoreboard;
    
//     mailbox mon2scb, gen2drv;
// 	// transaction tr_drv, tr_mon;/
//     int count;

//     bit [7:0] ds;
//     bit [7:0] ms;

//     function new(mailbox mon2scb,mailbox gen2drv);
//         this.mon2scb = mon2scb;
//         this.gen2drv = gen2drv;
//     endfunction

//     task main();
        
//         forever begin
//             mon2scb.get(ms);
//             gen2drv.get(ds);

            

//             // tr_mon.display("mon->scoreboard");


//              if (ms == ds)
//                  $display("[SCO] : DATA MATCHED");
//              else
//                  $display("[SCO] : DATA MISMATCHED");
//              $display("--------------------------------------");

//             count++;
//         end
//     endtask : main
// endclass : scoreboard


// scoreboard.sv
`include "transaction.sv"

class scoreboard;
    
    mailbox mon2scb, gen2drv;
    transaction tr_drv, tr_mon;
    int count;

    bit [7:0] received_data;
    int i;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
        // this.gen2drv = gen2drv;
    endfunction

    task main();
        forever begin
            // Get the monitored data
            mon2scb.get(tr_mon);
            // Get the generated data
            // gen2drv.get(tr_drv);

            received_data <= {tr_mon.miso , received_data[7:1]};
            $display("received_data = %b", received_data);
            // if (tr_mon.sclk == 1 && tr_mon.cs_in == 0) begin
            //     if (count == 8) begin
            //         expected_data = tr_drv.data_out; 
                     if (received_data == tr_mon.data_out) begin
                         $display("[SCO] : DATA MATCHED");
                     end else begin
                         $display("[SCO] : DATA MISMATCHED");
            //             $display("[SCO] : Expected: %b, Received: %b", expected_data, received_data);
                     end
            //         $display("--------------------------------------");
            //         count = 0;
            //     end
                    count++;
            // end
        end
    endtask : main
endclass : scoreboard

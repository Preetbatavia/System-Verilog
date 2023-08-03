`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  driver d0;
  generator g0;
  monitor m0;
  scoreboard s0;
  
  virtual data_if vif;
  mailbox gen_drive;
  mailbox mon_scb;
  function new(virtual data_if vif);
    //get the interface from test
    this.vif = vif;
     
    //creating the mailbox (Same handle will be shared across generator and driver)
    gen_drive = new();
    mon_scb = new();
    
     
    //creating generator and driver
    g0  = new(gen_drive);
    d0 = new(vif,gen_drive);
    m0 = new(vif,mon_scb);
    s0 = new(mon_scb);
    
    
  endfunction
  
  task run();
    d0.reset();
    fork
      d0.run();
      g0.run();  
      m0.run();
      s0.run();
    join_any
    // Wait until all the transactions have been created by the generator.
    wait(g0.done.triggered);
    // Wait until all transaction have been driven to the DUT.
    wait(g0.count == d0.num_trans);
     $finish;
 endtask
endclass 


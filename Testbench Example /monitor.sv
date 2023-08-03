// Monitor converts signal activity to transaction level objects.
class monitor; 
  // Declaring virtual interface handles 
  virtual data_if vif ;
  // Declaring the mailbox handle to send the transaction to the scoreboard
  mailbox mon_scb;
  // Constructor the receive the interface and mailbox handles from the environment
  function new(virtual data_if vif, mailbox mon_scb);
    this.vif = vif;
    this.mon_scb = mon_scb;
  endfunction 
  
  task run();
    forever begin 
      transaction data_in;
      data_in = new();
      @(posedge vif.clk);
      // Converts signal level activity to transaction objects.
      data_in.data = vif.data;
      data_in.incr = vif.incr;
      data_in.decr = vif.decr ;
      data_in.error = vif.error;
      data_in.reset = vif.reset;
      // Send the transaction objects to the scoreboard.
      mon_scb.put(data_in);
    end 
  endtask
endclass 

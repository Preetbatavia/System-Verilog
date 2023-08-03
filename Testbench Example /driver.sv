// Driver class receives the generated transaction items from the mailbox and converts it to signals to drive it to the DUT through the interface.
class driver;
  //Creating virtual interface handles.
  virtual data_if vif;
  // Creating mailbox handle
  mailbox gen_drive;
  //To count the number of transaction driven 
  int num_trans;
  // Constructor to receive the virtual interface and mailbox handles from the environment.
  function new(virtual data_if vif,mailbox gen_drive);
    this.vif = vif;
    this.gen_drive = gen_drive;
  endfunction
  // Reset all the signals before starting the simulation.
  task reset();
    vif.reset <= 0;
    vif.incr <=0;
    vif.decr <=0;
    vif.error <=0;
    vif.data <=0;
    
  endtask
  
  task run();
    // Forever block to keep looking for any transaction items from the mailbox.
    forever begin 
      transaction item;
	 gen_drive.get(item);
      @(posedge vif.clk);
      //Send the signals onto the interface 
      vif.reset <= item.reset;
      vif.data <= item.data;
      // Increment the number of transaction sent to the DUT.
      num_trans++;
    end
  endtask
endclass

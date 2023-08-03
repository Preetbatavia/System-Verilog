// Generator class generates the stimulus by randomizing the transaction object and sends it to a driver through the mailbox

class generator;
  // Declaring the transaction object as rand to randomize it. 
  rand transaction data;
  // Declaring the mailbox.
  mailbox gen_drive;
  // event 
  event done;
    // count variable to control the number of times the transaction needs to be generated.
  int count;
  // Constructor to get the mailbox handle from the environment
  function new(mailbox gen_drive);
    this.gen_drive = gen_drive;
  endfunction 
  
  // Main task that creates and randomizes the transaction item and send it to the mailbox.
  task run();
    $display("Count : %0d",count);
    repeat(count)
      begin
    	data = new();
        
        if( !data.randomize() ) $fatal("Gen:: data randomization failed");
     	 data.display("[ Generator ]");
        // Put the created transaction item in the mailbox.
       	 gen_drive.put(data);
      end 
    // Trigger the event once all the transaction items have been created.
    ->done;
  endtask
endclass

//Scoreboard receives  the transaction objects from the monitor and compares it to the expected result.
class scoreboard;
  // Mailbox handle
  mailbox mon_scb;
  int no_trans;
  // temp 4 bit data to store the previous data input as in the design.
  bit [3:0]temp;
  // Constructor to receive the mailbox handle from the evironment.
  function new(mailbox mon_scb);
    this.mon_scb = mon_scb;
    temp = 0;
  endfunction 
 
  task run();
    transaction data;
    forever begin 
      
      mon_scb.get(data);
      $display("%0t[ SCB ] temp = %0d data = %0d reset = %0d",$time,temp,data.data,data.reset);
      if(data.reset == 1)
        begin 
          if(data.incr == 0 && data.decr == 0 && data.error == 0)
            $display("%0t[ SCB ] Check passed for reset",$time);
          else 
            $error("Expected Incr , decr and error to be 0");
        end 
      
      else if(data.data == temp)
        begin
          if(data.incr == 0 && data.decr == 0 && data.error == 0)
          $display("%0t[ SCB ] Check passed for data  = previous data",$time);
          else
            $error("Expected Incr , decr and error to be 0");
        end
      else if(data.data > temp)
        begin
          if(data.data - temp == 1)
            begin
              if(data.incr == 1 && data.decr == 0 && data.error == 0)
                $display("%0t[ SCB ] Check passed for Increment",$time);
              else
                $error("Expected Incr to be 1 and others to be 0");
            end 
          	else
              begin
                if(data.incr == 0 && data.decr == 0 && data.error == 1)
                  $display("%0t[ SCB ]Check passed for ERROR",$time);
               	else
                  $error("Expected error to be 1 and others to be 0");
              end
        end 
      else if(data.data < temp)
        begin 
          if(temp - data.data == 1)
            begin
               if(data.incr == 0 && data.decr == 1 && data.error == 0)
                 $display("%0t[ SCB ] Check passed for decrement",$time);
              	else
                  $error("Expected Decr to be 1 and others to be 0");
            end 
          	else
              begin
                if(data.incr == 0 && data.decr == 0 && data.error == 1)
                  $display("%0t[ SCB ]Check passed for  ERROR",$time);
                else
                  $error("Expected Error  to be 1 and others to be 0");
              end
        end
      // Assign the current data input to the temp register.
      temp <= data.data;
    end 
    
  endtask
  
endclass 

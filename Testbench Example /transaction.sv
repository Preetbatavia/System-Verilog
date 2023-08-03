// Base transaction Item declaration 
class transaction;
  
  randc bit[3:0] data;
  bit incr;
  bit decr;
  bit error;
  rand bit reset;
  
  function void display(string name);
    
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display(" Data = %0d",data);
    $display("-------------------------");
    $display("reset = %0d",reset);
  endfunction 
  // Constraint to generate data values inside a specified range 
  //Taking the range 1-4 t0 check if all the increment ,decrement and stable scenarios work correctly.
  constraint data_1{data inside {[1:4]};};
  
endclass 

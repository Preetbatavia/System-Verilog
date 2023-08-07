// Constraint for generating a fibonacci series 

class fibonacci ; 
  rand int fib_series []; // Create a Dynamic array for storing the fibonacci series. 
  constraint fib_size {fib_series.size inside {[10:15]};} // Constraint for the dynamic array size 
  constraint fib {fib_series[0] == 0 ; 
                  fib_series[1] == 1;
                  foreach(fib_series[i])
                    if(i>=2)
                    fib_series[i] == fib_series[i-1]+fib_series[i-2];
                 }
endclass 

module fib_top ;
  initial begin 
    repeat(20) begin 
      fibonacci fib = new(); 
      assert(fib.randomize());
      $display("%0p",fib.fib_series);
    end
  end 
endmodule 

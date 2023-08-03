`include "interface.sv"
`include "test.sv"
// Testbench top module 
module tb_top;
  // clk singal declaration 
  reg clk;
// Initialize the clock to 0 at 0 ns.
  initial begin
    clk <= 0;
  end 
  // Clock generation 
  always #10 clk = ~clk;
  //Creating an instance of the interface 
  data_if _if(clk);
  // Creating an instance of the test and sending the interface as the parameter.
  test t1(_if);
  // Connect interface signals to that of the DUT 
  incr_decr_series u1(.clk(_if.clk),.reset(_if.reset),.data(_if.data),.incr(_if.incr),.decr(_if.decr),.error(_if.error));
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule 

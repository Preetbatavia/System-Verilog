`include "environment.sv"
program test(data_if data_if);
  // Declaring the environment instance 
  environment e0;
  initial begin
    // Creating a new environment the sending the interface handle
    e0 = new(data_if);
    // Sending the number of transactions to be created by the generator.
    e0.g0.count = 15;

    e0.run();
  end
endprogram

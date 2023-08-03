// CANDIDATE NAME : Preet Paras Batavia 
//--------------------------------------------------------------------
// DUT Description :
//--------------------------------------------------------------------
// Detect if the input series of data is incrementing or decrementing
// Inputs to the DUT are clk, reset & 4 bit data input
// Outputs from the DUT are incr, decr, error
// If data increases by 1, flag the incr output as 1
// If data decreases by 1, flag the decr output as 1
// Else flag the error outputs as 1
//--------------------------------------------------------------------

// Code your DUT here
// Describe all your assumptions
module incr_decr_series(incr ,decr , error , clk , reset ,data);
  input clk , reset ;
  input [3:0]data; 
  output reg incr ,decr ,error;
  // Internal temp register to store the previous data input 
  reg [3:0]temp= 0;
  // Assign the current data input to the internal register at every clk edge. 
  always@(posedge clk)
    temp <= data ;
  
  always@(posedge clk)
    begin
      // Consider Synchronous reset.
      if(reset)
        begin
          incr <= 0;
          decr <= 0;
          error<=0;
        end
      else
        begin 
          // Make the output flag as default 0. 
          incr<=0;
          decr<=0;
          error<=0;
        // If current input is incremented by 1 as compared to previous input,  make incr as 1
          if(data == temp + 1)
              incr <=1;
        // If current input is decremented by 1 as compared to previous input,  make decr as 1      
          else if(data == temp -1)
            decr <=1;
         // If difference between current and the previous input is more than one,  make error  as 1 
          else if((temp -data > 1)||(data - temp > 1))
            error <= 1;
        // If the data input is stable , make all outputs flags to 0.  	
          else if(temp == data)
            begin
              incr <= 0;
              decr <= 0;
              error <=0;
            end 
        end 
       
    end 
endmodule

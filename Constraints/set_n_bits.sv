// Write a Constraint so that only n bits are set in a 6 bit number without using $countones. 
// Idea : 1. Create array of  n elements (Number of bits required to be set).
//        2. Randomize each row to onehot without using countones. 
//        3. Make sure that no two rows are the same.  
module count_bits ; 
  class count_n_bits; 
    rand bit [5:0] num []; 
    bit [5:0] final_val ; 
    rand int power[] ; 
    
    constraint size {num.size() ==  4;}
    
    constraint num_val {foreach(num[i]) num[i]!= 0 ; foreach(num[i]) (num[i] & (num[i])-1) == 0; foreach(num[i]) foreach(num[j]) if(i!=j)num[i]!=num[j];}
    
    function void post_randomize(); 
      foreach(num[i]) begin
      $display("num[%0d] : %b \n" ,i, num[i]);
        final_val |= num[i];
      end 
    endfunction 
    
    
  endclass 
  initial begin 
    count_n_bits n_bits = new() ; 
    repeat(10) begin 
      n_bits.randomize(); 
      $display("Final Val : %b \n",n_bits.final_val);
      $display("------------------------ \n");
      n_bits.final_val = 0  ; 
    end 
  end 
endmodule 

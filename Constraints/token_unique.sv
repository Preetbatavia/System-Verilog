// Given 100 token with unique values between 0-1000 . Select at random 5-10 tokens . 

class rand_token ; 
  rand int tok_arr[]; 
  rand int sel_tok[];
  
  constraint arr_size{tok_arr.size() == 100;sel_tok.size() inside {[5:10]};}
  constraint tok_val{foreach(tok_arr[i]) tok_arr[i] inside {[1:1000]};unique{tok_arr};}
  constraint sel_tok_val {foreach(sel_tok[i]) sel_tok[i] inside {tok_arr};unique{sel_tok};}
endclass 

module abc; 
  initial begin
    rand_token xyz = new() ; 
    repeat(10)begin 
     xyz.randomize(); 
     $display("%0p",xyz.sel_tok);
    end 
  end 
endmodule 

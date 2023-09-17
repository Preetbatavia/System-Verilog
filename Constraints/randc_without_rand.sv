// Implement a randc behaviour without using randc. 

class w_randc ; 
  rand bit[1:0] num ; 
  bit[3:0] num_q[$:4]; 
  
  constraint num_val{!(num inside {num_q});}
  
  function void post_randomize();
    num_q.push_back(num);
    if(num_q.size() == 4)
      num_q.pop_front();
  endfunction
  
  
  
endclass 

module abc ; 
  initial begin 
    w_randc xyz = new() ; 
    repeat(20)begin 
      xyz.randomize() ; 
      $display("%0d" , xyz.num);
    end 
  end 
endmodule 

//--------------------------------------------------------
// Write a constraint on a 4 bit variable such that the probability of the lower two bits having the same bits is only 5%
// Author : Preet Batavia 
// Date   : Aug 24 2023. 
//--------------------------------------------------------

class var_4 ; 
  rand bit[3:0] val; 
  rand bit flag; 
  constraint sol_b {solve flag before val;}
  constraint flag_c {flag dist {0:/5 , 1:/95};(flag == 0)-> (val[0]==val[1]);(flag == 1)-> (val[0] != val[1]);}
  
endclass 

module abc; 
  initial begin 
    var_4 last_2 = new(); 
    repeat(100)begin 
      last_2.randomize(); 
       $display("Flag : %b",last_2.flag);
       $display("Val : %b ",last_2.val);
    end 
  end 
endmodule 

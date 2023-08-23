//Distribution constraint to create the following distribution : 
// 1 ones - 10% , 2 1's - 10% .....  10 one's 10%.

class abc; 
  rand logic [9:0] arr; 
  constraint arr_val {$countones(arr) dist{[1:10]:=10};}
endclass

module xyz ; 
  initial begin 
    abc arr_c = new();
    repeat(100)begin
     arr_c.randomize();
     $display("%b \n",arr_c.arr);
    end
  end 
endmodule 

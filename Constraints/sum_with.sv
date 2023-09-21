// Write a System Verilog code to generate an array of 10 elements where 25 percent elements are odd and 75 percent are even . 

class arr_dist;
  rand int arr[];  
  constraint arr_size{arr.size() == 10;}
  constraint arr_val{foreach(arr[i]) arr[i] inside {[1:10]};
   arr.sum() with (int'(item%2==0)) == 3;
   arr.sum() with (int'(item%2!=0)) == 7;}
endclass 
module abc; 
  initial begin 
    arr_dist xyz = new() ; 
    xyz.randomize() ; 
    $display("%0p" , xyz.arr);  
  end 
endmodule 

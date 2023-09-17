// Write a System Verilog Constraint to generate a 2D Array having unique values 

class twod_uniq;
  rand int arr[9][9];
  local rand int unsigned col[9][9];
  local rand int unsigned block[9][9];
 // constraint arr_size{arr.size()  == 5; foreach(arr[i]) arr[i].size() == 5;} // This creates a 5x5 array of integers. 
  constraint arr_vals{foreach(arr[i,])unique{arr[i]};}
  constraint arr_vals_1{foreach(arr[i,j])arr[i][j] inside {[1:9]};}
  constraint transpose{foreach(arr[i,j])col[j][i]==arr[i][j];}
  constraint transpose_val{foreach(col[i,])unique{col[i]};}
endclass 

module arr_val; 
  initial begin
  	twod_uniq uniq = new(); 
  	uniq.randomize();
    foreach(uniq.arr[i,])begin 
      $display("%0p",uniq.arr[i]);
    end 
  end 
endmodule 

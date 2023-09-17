//Write a System verilog constraint to generate a 2D Array where if a value is 0 ,  it is surrounded by 1's 

class surr ; 
  localparam M =5 ;  
  localparam N = 10;
  rand logic arr[N][N]; 
  //Set the value of each element of the array 
  constraint arr_val {foreach(arr[i,j])arr[i][j] inside {[0:1]};arr[N/2][N/2] == 0;}
  constraint arr_surround{foreach(arr[i,j]) {if(arr[i][j]==0 && i < N-1 && j<N-1) {arr[i+1][j] == 1; arr[i+1][j+1] == 1 ; arr[i][j+1] == 1;arr[i-1][j]==1;arr[i][j-1]==1;arr[i+1][j-1] == 1;arr[i-1][j+1] == 1;arr[i-1][j-1] == 1;}}}
  
endclass 
module abc;
  initial begin 
    surr uniq = new(); 
  	uniq.randomize();
    foreach(uniq.arr[i,])begin 
      $display("%0p",uniq.arr[i]);
    end 
  end 
endmodule 

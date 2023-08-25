// Create an array of unique values without unique keyword. 

module unique_array;

class uniq_arr;
 rand bit [3:0] val;
 bit [3:0] dynamic_arr[]; 
 bit [3:0] queue_arr[$];
 int j ; 
 constraint arr_val_in_q{!(val inside{queue_arr});}
 function void post_randomize();
  queue_arr.push_front(val);
 endfunction 
endclass 
initial begin
 uniq_arr u_arr = new();
 u_arr.dynamic_arr = new[10];
 repeat(10)
  u_arr.randomize();
   foreach(u_arr.queue_arr[i])
    u_arr.dynamic_arr[i] = u_arr.queue_arr[i];
    $display("%0p ",u_arr.queue_arr);
    foreach(u_arr.dynamic_arr[i])
     $display("%0d ",u_arr.dynamic_arr[i]);
end 
endmodule

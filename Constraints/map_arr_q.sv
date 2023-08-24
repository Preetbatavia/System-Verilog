//------------------------------------------------------------------------
// Write a constraint to map elements of an array into N non empty queues. 
// Author : Preet Batavia 
// Date   : Aug 24 2023. 
//------------------------------------------------------------------------

class arr_map; 
  rand int arr[]; 
  int queue[5][$]; 
  
  constraint size_c {arr.size() inside{[12:30]};}
  constraint val_c {foreach(arr[i]) arr[i]==i;}
  
  function void post_randomize(); 
    foreach(arr[i])
      begin 
        queue[i%5].push_back(arr[i]); 
      end 
  endfunction 
endclass 
module abc ; 
  initial begin 
    arr_map q_map = new(); 
    q_map.randomize();   
    foreach(q_map.queue[i])
      begin 
        $display("%0p ",q_map.queue[i]);
      end 
  end 
endmodule 

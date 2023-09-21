// Write a system verilog constraint to generate address regions within a given range which is nonoverlapping and contiguous 

class addr_reg; 
  typedef struct{
  rand int index ; 
  rand bit [31:0] addr_s ; 
  rand bit [31:0] addr_e ; 
  rand bit [31:0] size   ; 
  } regions_t; 
  
  rand regions_t regions[];
  
  constraint num_reg{regions.size() inside {3,4};}
  
  constraint reg_val {foreach(regions[i]){
    regions[i].index == i ;
    regions[i].size inside {[10:20]} ; 
    regions[i].addr_e == regions[i].addr_s + regions[i].size -1 ; 
    regions[i].addr_s < regions[i].addr_e; 
    regions[i].addr_e < 100 ; // Upper Limit of all Memory locations.
    //foreach(regions[j]){
      //if(j<i)
        //!(regions[j].addr_s inside {[regions[i].addr_s:regions[i].addr_e]});}
        
    }}
    constraint cont {foreach(regions[i])
    {if(i< regions.size()-1)
      regions[i].addr_e == regions[i+1].addr_s -1;
    }}
  
endclass 


module abc ; 
  initial begin 
    addr_reg xyz = new() ; 
    xyz.randomize() ; 
    foreach(xyz.regions[i])
      begin 
        $display("-----------------"); 
        $display("Index::%0d::Start Addr::%0h::End Addr::%0h",xyz.regions[i].index,xyz.regions[i].addr_s , xyz.regions[i].addr_e); 
      end 
  end 
endmodule 

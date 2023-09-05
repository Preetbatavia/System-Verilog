// Write a System verilog code to generate an address for Mem W and mem R such that they dont overlap such that R takes 3 cycles and W takes 5 cycles. 
// Consider a 16 bit memory address. 

class gen_address ; 
  rand bit [2:0] addr_read ; 
  rand bit [2:0] addr_write ; 
  bit[2:0] addr_read_mem ; 
  bit[2:0] addr_write_mem ;
  bit [2:0] read_q[$] ; 
  bit [2:0] write_q[$] ; 
  
  
  
  constraint addr {addr_read != addr_write;!(addr_read inside {write_q});!(addr_write inside {read_q});}
  
  function void post_randomize();
    read_q.push_back(addr_read) ; 
    write_q.push_back(addr_write) ; 
    if(read_q.size() == 4 )
      read_q.pop_front() ; 
    if(write_q.size() == 6)
      write_q.pop_front(); 
  endfunction 
  
endclass 

module mem_add ; 
  initial begin 
    gen_address gen = new() ; 
    repeat(20)begin 
      gen.randomize(); 
      $display("R: %0h :: W : %0h || Read Queue : %0p || Write Queue : %0p" , gen.addr_read , gen.addr_write , gen.read_q , gen.write_q );
    end 
  end 
endmodule 

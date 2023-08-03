// Derive Prime numbers between a range of numbers

module prime ; 
  class find_prime;
   randc int prime_val ; 
   int queue [$];
   constraint c_prime{prime_val inside{[1:100]};!(prime_val inside {queue});}
   function void post_randomize();
     int flag = 1 ; 
     for(int i = 2 ; i < prime_val ; i++)begin
       if(prime_val%i == 0)
	 begin
	  flag = 0;	
	  break;
          end 				
     end
    if(flag == 1 && (prime_val!=0 && prime_val!=1))
     queue.push_back(prime_val);
   endfunction
  endclass
  initial begin 
   find_prime o_prime = new();
   repeat(500)
   begin 
     o_prime.randomize();
   end
   $write("%0p ",o_prime.queue);
	  $display("%0d ",o_prime.queue.size()); 
   end 
endmodule

// Write a constraint that generates Add, mul, sub, nop instructions.
// Such that no Add instruction is repeated in 3 clock cycles 
// sub is not repeated in the last 3 valid instructions. 
// Nop is not a valid instruction
class val_instr; 
  typedef enum {ADD, MUL , SUB , NOP} instr; 
  randc instr ins; 
  instr queue_add[$];
  instr queue_sub[$];
  
  constraint add_c {(ins == ADD)->!(ins inside {queue_add});}
  constraint sub_c {(ins == SUB)->!(ins inside {queue_sub});}
  function void post_randomize();
    queue_add.push_back(ins);
    if(queue_add.size() == 3)
      queue_add.pop_front();
    if(ins == ADD || ins == SUB || ins == MUL)
      queue_sub.push_back(ins); 
    if(queue_sub.size() == 3)
      queue_sub.pop_front();
  endfunction 
  
endclass 

module abc; 
  initial begin 
    val_instr val = new(); 
    repeat(20)begin 
      val.randomize(); 
      $display("Instruction : %s", val.ins);
    end 
  end 
endmodule 

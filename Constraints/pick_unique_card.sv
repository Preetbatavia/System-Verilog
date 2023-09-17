//Given pack of 52 playing cards (4 faces each with numbers 1-13), write SV //code that randomizes and returns 4 cards with unique face and number

class cards_c ; 
  rand int cards[4][13]; 
  rand int cards_sel[4] ; 
  //Assign the numbers 1-13 to each colour of cards.
  constraint cards_val{foreach(cards[i,j]) cards[i][j] == j+1;}
  constraint cards_select{foreach(cards_sel[i])cards_sel[i] inside{cards[i]};unique{cards_sel};}
  
  
endclass 

module abc; 
  initial begin
    cards_c cards_o = new(); 
    cards_o.randomize(); 
    $display("%0p" , cards_o.cards_sel);
  end 
endmodule 

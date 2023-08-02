// Create a series : 010203040506070809

module series ;
	class series_a; 
		rand int a[];
		
		constraint a_size{a.size inside {[6:20]};}
		constraint a_val{foreach(a[i])
											if(i%2==0)a[i]==0;	
											else a[i]==(i+1)/2;}

	endclass

	initial begin 
		series_a s_a = new();
		
		repeat(20)begin 
			s_a.randomize();
			foreach(s_a.a[i])
				$write("%0d ",s_a.a[i]);
			$display("\n\n");
		end
	end 
endmodule

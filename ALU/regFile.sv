module regFile(input logic clk, input logic we3, input logic [3:0] ra1, ra2, ra3, input logic [31:0] wd3, r11, 
					output logic [31:0] rd1, rd2);
	

//El ra3 	
	
	always_ff @(posedge clk) begin
		
		rd1=ra1;
		rd2=ra2;
		
	end
		
	
endmodule 
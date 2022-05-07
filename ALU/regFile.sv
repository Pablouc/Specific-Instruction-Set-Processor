module regFile(input logic clk, input logic we3, input logic [3:0] ra1, ra2, ra3,input logic [23:0] wd3, 
					output logic [23:0] rd1, rd2);
	
//input logic [23:0] wd3, r11----> Hay que agregarlos
	
	
 logic [23:0] rf[11:0];	
	
	always_ff @(posedge clk) begin
		
		if (we3) rf[ra3] <= wd3;
		
	end
	assign rd1=ra1;
	assign rd2=ra2;
		
	
endmodule 
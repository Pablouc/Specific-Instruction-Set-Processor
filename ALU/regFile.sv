module regFile(input logic clk,input logic [15:0] pc, input logic we3, input logic [3:0] ra1, ra2, ra3,
				input logic [23:0] wd3, output logic [23:0] rd1, rd2);
	
//input logic [23:0] wd3, r11----> Hay que agregarlos
	
	
 logic [23:0] rf[11:0];	
	
	always_ff @(posedge clk) begin
		
		if(pc==16'b0) 
		rf<= '{24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000, 24'h000000,
				24'h000000, 24'h000000, 24'h000000,24'h000000, 24'h000000}; 

		
		if (we3) rf[ra3] <= wd3;
		
	end
	
	assign rd1=rf[ra1];
	assign rd2=rf[ra2];
		
	
endmodule 
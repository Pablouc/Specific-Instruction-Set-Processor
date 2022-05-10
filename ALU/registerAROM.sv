module registerAROM(input logic [23:0] inst, input logic clk, 
	output logic [23:0] instrd);
	always_ff @(posedge clk) begin        
       instrd <= inst;
	end
endmodule 
module registerAROM(input logic [23:0] inst, input logic clk, rst, stallF,
	output logic [23:0] instrd);
	
	always_ff @(posedge clk, posedge rst) begin 
		if (rst) instrd <= 23'b0;
		else
			if (~stallF)
				instrd <= inst;
	end
endmodule 
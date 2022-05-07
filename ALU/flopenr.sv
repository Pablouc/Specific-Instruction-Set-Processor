module flopenr #(parameter M = 8)(input logic clk, reset, en, input logic [M-1:0] d, output logic [M-1:0] q);
												  
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else if (en) q <= d;
		
endmodule 
module ffNextValue #(parameter M) (input logic clk, reset, stallF, input logic [M-1:0] d, output logic [M-1:0] q);

	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else 
			if(~stallF)q <= d;
		
endmodule 
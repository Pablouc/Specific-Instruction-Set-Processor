module andGate #(parameter WIDTH=3)(
	input logic [WIDTH:0] a, b,
	output logic [WIDTH:0] out);
	
assign out= a&b;
	
endmodule
	
module full_adder(input logic a, b, ci, 
						output logic s, co);
			

logic xorAB;

assign xorAB = a ^ b;
assign s = xorAB ^ ci;
assign co = (a & b) | (ci & xorAB);
	
			
endmodule

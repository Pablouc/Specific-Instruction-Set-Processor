	module nbit_full_adder #(parameter WIDTH=3)(input logic [WIDTH:0] a, b, 
							  input logic ci,
							  output logic[WIDTH:0] s, 
							  output logic co);

logic [WIDTH-1:0] coWire;



genvar i;
generate
for(i=0; i<WIDTH+1; i++)begin : geninstance
  if(i==0)
	full_adder f1_instance(a[i], b[i], ci, s[i], coWire[i]);
  if(i==WIDTH)
	full_adder f2_instance(a[i], b[i], coWire[i-1], s[i], co);
  else if(i!=0 & i!=WIDTH)
	full_adder f3_instance(a[i], b[i], coWire[i-1], s[i], coWire[i]);		
end	
endgenerate



endmodule

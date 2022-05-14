module comp2 #(parameter WIDTH)(input [WIDTH:0] ain,bin, output logic [WIDTH+1:0] bout, aout);

logic [WIDTH:0] bcomp1;
logic [WIDTH:0] bcomp2;

assign aout[WIDTH+1]=1'b0;
assign aout[WIDTH:0]=ain;


assign bcomp1[WIDTH:0]=bin;
assign bcomp2=~bcomp1+1;
assign bout[WIDTH+1]=1'b1;
assign bout[WIDTH:0]=bcomp2;

endmodule

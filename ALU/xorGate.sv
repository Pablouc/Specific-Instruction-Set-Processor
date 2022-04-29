module xorGate #(parameter WIDTH=3)(input[WIDTH:0] a, b, output[WIDTH:0] out);
assign out=a^b;
endmodule

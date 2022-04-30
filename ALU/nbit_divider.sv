module nbit_divider #(parameter WIDTH)(input logic [WIDTH:0] a, b ,output logic[WIDTH:0] out);
assign out=a/b;

endmodule
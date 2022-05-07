module adder #(parameter M)(input logic [M-1:0] a, b, output logic [M-1:0] resultado);

	assign resultado = a + b;

endmodule 
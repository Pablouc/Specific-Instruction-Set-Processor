module extendSign (input logic [11:0] inst, input logic  immSrc, output logic [23:0] extImm);


	always_comb
		case(immSrc)
			// 8-bit unsigned immediate
			1'b0: extImm = {16'b0, inst[7:0]};
			// 12-bit unsigned immediate
			1'b1: extImm = {20'b0, inst[11:0]};
			
		default: extImm = 24'bx; // undefined
	endcase
endmodule 
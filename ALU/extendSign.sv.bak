module extendSign (input logic [20:0] Instr, input logic [1:0] ImmSrc, output logic [31:0] extImm);


 ExtImm = {11'b0, Instr[20:0]};

//	always_comb
//		case(ImmSrc)
//			// 8-bit unsigned immediate
//			2'b00: ExtImm = {24'b0, Instr[20:0]};
//			// 12-bit unsigned immediate
//			2'b01: ExtImm = {20'b0, Instr[11:0]};
//			// 24-bit two's complement shifted branch
//			2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00};
//		default: ExtImm = 32'bx; // undefined
//	endcase
endmodule 
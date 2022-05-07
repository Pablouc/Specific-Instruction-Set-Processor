module condLogic(input logic clk, reset, flagUpdate,aluZero, PCS, regW, //MemW, 
						output logic PCSrc, RegWrite); // MemWrite);

					
	//logic [1:0] FlagWrite;
	logic zeroFlag;
	
	
	flopenr #(1)flagreg1(clk, reset,flagUpdate, aluZero, zeroFlag);
	//flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	//assign MemWrite = MemW & zeroFlag;
	//assign PCSrc = PCS & zeroFlag;
	assign RegWrite = regW & zeroFlag;
	
	
endmodule 
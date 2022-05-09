module controlUnit(input logic clk, rst, aluZero, input logic[3:0] opcode, 
					output logic regWrite, aluSrc, PCSrc, immSrc,memToReg,memWrite,ra2Src, 
					output logic [1:0]  aluControl);
						
logic PCS, regW, flagUpdate, memWriteSrc;
			
	decoder deco(opcode, regW, aluSrc, PCS, immSrc,flagUpdate,memToReg,memWriteSrc,ra2Src, aluControl);
   condLogic conditional(clk, rst, flagUpdate,aluZero, PCS, regW,memWriteSrc, PCSrc, regWrite, memWrite);


endmodule 
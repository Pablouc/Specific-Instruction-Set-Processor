module controlUnit(input logic clk, rst, aluZero, input logic[3:0] opcode, 
					output logic regWrite, aluSrc, PCSrc, immSrc, output logic [1:0]  aluControl);
						
logic PCS, regW, flagUpdate;
			
	decoder deco(opcode, regW, aluSrc, PCS, immSrc,flagUpdate, aluControl);
   condLogic conditional(clk, rst, flagUpdate,aluZero, PCS, regW, PCSrc, regWrite);


endmodule 
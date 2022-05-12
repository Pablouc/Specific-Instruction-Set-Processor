module controlUnit(input logic clk, rst, input logic[3:0] opcode, 
					output logic aluSrc, immSrc,memToReg,ra2Src,ra1Src, PCS, regW, memWriteSrc, 
					output logic [1:0]  aluControl);
						
logic flagUpdate;
			
	decoder deco(opcode, regW, aluSrc, PCS, immSrc,flagUpdate,memToReg,memWriteSrc,ra2Src,
					ra1Src, aluControl);


endmodule 
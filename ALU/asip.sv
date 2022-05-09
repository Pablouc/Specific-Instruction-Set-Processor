module asip(input logic clk, rst , input logic [23:0] inst, rdMemData, output logic[15:0] PC, aluRes,
				output logic [23:0] result,data, output logic memWrite);
				
	logic regWrite, aluSrc, PCSrc, immSrc, aluZero, memToReg, ra2Src;
	logic [1:0] regSrc, aluControl;
	
	controlUnit controller(clk, rst, aluZero, inst[23:20], regWrite, aluSrc, PCSrc, immSrc,memToReg, 
									memWrite,ra2Src, aluControl);
	
	datapath datapath(clk,rst,regWrite,aluSrc, PCSrc,immSrc,memToReg,memWrite,ra2Src,  aluControl,
							inst,rdMemData,result,data, aluRes,PC, aluZero);
	
	

endmodule 
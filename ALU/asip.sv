module asip(input logic clk, rst , input logic [23:0] inst, output logic[15:0] PC, aluRes);

	logic regWrite, aluSrc, PCSrc, immSrc, aluZero;
	logic [1:0] regSrc, aluControl;
	
	controlUnit controller(clk, rst, aluZero, inst[23:20], regWrite, aluSrc, PCSrc, immSrc, aluControl);
	
	datapath datapath(clk, rst, regWrite, aluSrc, PCSrc, immSrc, aluControl, inst, aluRes,PC, aluZero);

		
	
	

endmodule 
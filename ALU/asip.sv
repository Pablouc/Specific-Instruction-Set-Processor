module asip(input logic clk, rst , input logic [23:0] inst, rdMemData, output logic[15:0] PC, aluRes,
				output logic [23:0] resultW, WD, output logic [15:0] A, output logic memWriteM);
				
	logic aluSrc, immSrc, aluZero, memToReg, ra2Src, regWriteE, PCSrcE,memToRegE, 
	PCS, regW, memWriteSrc,memWriteE, PCSrcE2, regWriteE2, memWriteE2,
	PCSrcM, regWriteM,memToRegM,PCSrcW, regWriteW,memToRegW ;
	logic [1:0] regSrc, aluControl;
	logic [3:0] WA3E,WA3M,WA3W;
	logic [23:0] RD;
	logic [15:0] AluOutW;
	
	controlUnit controller(clk, rst, inst[23:20], aluSrc, immSrc,memToReg,ra2Src, PCS, regW, memWriteSrc, 
									aluControl);
	
	datapath datapath(clk,rst,regW,regWriteW,aluSrc, PCS,immSrc,memToReg,memWriteSrc,ra2Src,  aluControl,
							inst,resultW,data, aluRes,PC, aluZero, regWriteE, PCSrcE,memToRegE, memWriteE, WA3E);
	
	condLogic conditional(clk, rst, flagUpdate,aluZero, PCSrcE, regWriteE,memWriteE, PCSrcE2, regWriteE2, memWriteE2);
	
	registerAALU regALU(aluRes,data, WA3E, clk, PCSrcE2, regWriteE2, memWriteE2,memToRegE,
	A, WD, WA3M, PCSrcM, regWriteM, memWriteM,memToRegM);
	
	registerAMem regMem(rdMemData, A, WA3M, clk, PCSrcM, regWriteM,memToRegM, 
	RD, AluOutW, WA3W, PCSrcW, regWriteW,memToRegW );
	
	//Mux entre MemData y ALU revisar
	mux2a1 #(24) muxMemALU(RD, AluOutW, memToRegW, resultW);
	
endmodule 
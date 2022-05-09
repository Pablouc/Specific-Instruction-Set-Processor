module datapath(input logic clk, rst, regWrite,regWriteW, aluSrc, PCSrc, immSrc,memToReg, memWrite,ra2Src, 
					input logic [1:0]  aluControl,input logic [23:0] inst, 
					input logic [23:0] result,output logic [23:0] data, output logic [15:0] aluRes, PC, output logic cero, 
					regWriteE, PCSrcE,memToRegE, memWriteE, output logic [3:0] WA3E );
	
	
	logic [23:0] srcA,srcB,aluResult, rd1,rd2, extImm, srcBAlu, extImmE;
	logic [15:0] pcNext;
	logic [3:0] ra2;
	logic [1:0] aluControlE;
	logic aluSrcE, 
			ci, co, negativo, acarreo, desbordamiento;
	
	//llamando al register file
	regFile regfile(clk, PC, regWriteW, inst[15:12],ra2,inst[19:16],result, rd1, rd2);
	
	
	// next PC logic
	ffNextValue #(16) pcRegister(clk, rst, pcNext, PC);
	adder #(16)pcAdder(PC, 16'b1 , pcNext);
	
	//Extensión de signo
	extendSign extSign(inst [11:0], immSrc,  extImm);
	
	//Mux entrada segundo operando register file
	mux2a1 #(4) muxRegFile(inst[11:8],inst[19:16] ,ra2Src , ra2);
	
	//register
	registerAReg(rd1,rd2,inst[19:16], extImm,clk,regWrite, aluSrc, PCSrc,memToReg, memWrite, 
					aluControl,srcA,srcB, WA3E,extImmE,regWriteE, aluSrcE, PCSrcE,memToRegE, memWriteE, 
					aluControlE);
	
	//Mux entrada b ALU
	mux2a1 #(24) muxALU(srcB, extImmE, aluSrcE, srcBAlu);

	//El parametro debe ir en 23, no 24.
	alu #(23) alu_instance(srcA,srcBAlu,aluControlE,1'b0,aluResult,co,negativo, cero, acarreo, desbordamiento);
	
	//aluRes es para el pc.
	assign aluRes= aluResult[15:0];
	assign data = srcB;
		
	
	
endmodule

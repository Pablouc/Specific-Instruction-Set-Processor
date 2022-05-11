module datapath(input logic clk, rst, regWrite,regWriteW, aluSrc, PCSrc, immSrc,memToReg, memWrite,ra2Src,ra1Src,PCSrcW, 
					input logic [1:0]  aluControl,input logic [23:0] inst,input logic [3:0] WA3W,
					input logic [23:0] resultW,output logic [23:0] srcB, output logic [15:0] aluRes, PC, output logic cero, 
					regWriteE, PCSrcE,memToRegE, memWriteE, output logic [3:0] WA3E );
	
	
	logic [23:0] srcA,aluResult, rd1,rd2, extImm, srcBAlu, extImmE;
	logic [15:0] pcNext, resultWwire, pcPlus1;
	logic [3:0] ra2, ra1;
	logic [1:0] aluControlE;
	logic aluSrcE, 
			ci, co, negativo, acarreo, desbordamiento;
	
	//llamando al register file
	regFile regfile(clk, PC, regWriteW, ra1,ra2,WA3W,resultW, rd1, rd2);
	
	
	// next PC logic
	adder #(16)pcAdder(PC, 16'b1 , pcPlus1);
	assign resultWwire=resultW[15:0];
	mux2a1 #(16) muxPcSrc(pcPlus1,resultWwire ,PCSrcW, pcNext);
	ffNextValue #(16) pcRegister(clk, rst, pcNext, PC);
	
	//Extensión de signo
	extendSign extSign(inst [11:0], immSrc,  extImm);
	
	//Mux entrada primer operando register file
	mux2a1 #(4) muxA1RegFile(inst[15:12],inst[19:16] ,ra1Src , ra1);
	
	//Mux entrada segundo operando register file
	mux2a1 #(4) muxA2RegFile(inst[11:8],inst[19:16] ,ra2Src , ra2);
	
	//register
	registerAReg regARefFile(rd1,rd2,inst[19:16], extImm,clk,rst, regWrite, aluSrc, PCSrc,memToReg, memWrite, 
					aluControl,srcA,srcB, WA3E,extImmE,regWriteE, aluSrcE, PCSrcE,memToRegE, memWriteE, 
					aluControlE);
	
	//Mux entrada b ALU
	mux2a1 #(24) muxALU(srcB, extImmE, aluSrcE, srcBAlu);

	//El parametro debe ir en 23, no 24.
	alu #(23) alu_instance(srcA,srcBAlu,aluControlE,1'b0,aluResult,co,negativo, cero, acarreo, desbordamiento);
	
	//aluRes es para el pc.
	assign aluRes= aluResult[15:0];
	//assign data = srcB;
		
	
	
endmodule

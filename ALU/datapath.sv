module datapath(input logic clk, rst, regWrite, aluSrc, PCSrc, immSrc,memToReg, memWrite,ra2Src, 
					input logic [1:0]  aluControl,input logic [23:0] inst,rdMemData, 
					output logic [23:0] result,rd2, output logic [15:0] aluRes, PC, output logic cero );
	
	
	logic [23:0] aluResult, rd1, extImm, srcBAlu;
	logic [15:0] pcNext;
	logic [3:0] ra2;
	logic ci, co, negativo, acarreo, desbordamiento;
	
	//llamando al register file
	regFile regfile(clk, PC, regWrite, inst[15:12],ra2,inst[19:16],result, rd1, rd2);
	
	// next PC logic
	ffNextValue #(16) pcRegister(clk, rst, pcNext, PC);
	adder #(16)pcAdder(PC, 16'b1 , pcNext);
	
	//Extensión de signo
	extendSign extSign(inst [11:0], immSrc,  extImm);
	
	//Mux entrada segundo operando register file
	mux2a1 #(4) muxRegFile(inst[11:8],inst[19:16] ,ra2Src , ra2);
	
	//Mux entrada b ALU
	mux2a1 #(24) muxALU(rd2, extImm, aluSrc, srcBAlu);
	
	//Mux entre MemData y ALU
	mux2a1 #(24) muxMemALU(rdMemData, aluResult, memToReg, result);
	
	//El parametro debe ir en 23, no 24.
	alu #(23) alu_instance(rd1,srcBAlu,aluControl,1'b0,aluResult,co,negativo, cero, acarreo, desbordamiento);
	
	//aluRes es para el pc.
	assign aluRes= aluResult[15:0];
	
endmodule

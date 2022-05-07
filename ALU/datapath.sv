module datapath(input logic clk, rst, regWrite, aluSrc, PCSrc, immSrc,input logic [1:0]  aluControl,
					input logic [23:0] inst, output logic [15:0]aluRes,PC, output logic cero );
	
	
	logic [23:0] aluResult, rd1, rd2, extImm, srcBAlu;
	logic[15:0] pcNext;
	logic ci, co, negativo, acarreo, desbordamiento;
	
	//llamando al register file
	regFile regfile(clk, regWrite, inst[15:12],inst[11:8],inst[19:16],aluResult, rd1, rd2);
	
	// next PC logic
	ffNextValue #(16) pcRegister(clk, rst, pcNext, PC);
	adder #(16)pcAdder(PC, 16'b1 , pcNext);
	
	//Extensión de signo
	extendSign extSign(inst [11:0], immSrc,  extImm);
	
	//Mux entrada b ALU
	mux2a1 #(24) muxALU(rd2, extImm, aluSrc, srcBAlu);
	
	//El parametro debe ir en 23, no 24.
	alu #(23) alu_instance(rd1,srcBAlu,aluControl,1'b0,aluResult,co,negativo, cero, acarreo, desbordamiento);
	
	//aluRes es para el pc.
	assign aluRes= aluResult[15:0];
	
endmodule

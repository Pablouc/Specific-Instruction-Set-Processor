module registerAMem(input logic [23:0] RD, input logic [15:0] ALUOutM, input logic [23:0] WA3M, input logic clk, 
	input logic PCSrcM, regWriteM,memToRegM,
	output logic [23:0] ReadData, output logic [23:0] AluOutW, output logic [23:0] WA3W, 
	output logic PCSrcW, regWriteW,memToRegW );
	
	always_ff @(posedge clk) begin        
       ReadData <= RD;
		 AluOutW <= ALUOutM;
		 WA3W <= WA3M;
		 PCSrcW <= PCSrcM;
		 regWriteW <= regWriteM;
		 memToRegW <= memToRegM;
		 //assign MemWrite = MemW & zeroFlag; any flag
	end
endmodule 
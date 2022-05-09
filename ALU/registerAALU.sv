module registerAALU(input logic [15:0] aluResult, input logic [23:0] writeData, input logic [23:0] WA3E, input logic clk, 
	input logic PCSrcE2, regWriteE2, memWriteE2,memToRegE, 
	output logic [15:0] A, output logic [23:0] WD, output logic [23:0] WA3M, 
	output logic PCSrcM, regWriteM, memWriteM,memToRegM  );
	always_ff @(posedge clk) begin        
       A <= aluResult;
		 WD <= writeData;
		 WA3M <= WA3E;
		 PCSrcM <= PCSrcE2;
		 regWriteM <= regWriteE2;
		 regWriteM <= regWriteE2;
		 memToRegM <= memToRegE;
		 //assign MemWrite = MemW & zeroFlag; any flag
	end
endmodule 
module processor(input logic clk, reset, output logic finished);
						//output logic [31:0] WriteData, DataAdr,
						//output logic MemWrite);
	
	logic [31:0] pc, instr, readData;
	rom meminstructions(PC[7:0],clk, inst);
	//asip myProcessor()
	
	//ARM arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	//memInstructions imem(PC, Instr);
	//memData dmem(clk, sw1, sw2, sw3, sw4, sw5, DataAdr, ReadData);
endmodule 

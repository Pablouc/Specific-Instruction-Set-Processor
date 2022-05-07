module decoder(input logic [3:0] opcode, output logic regWrite, aluSrc, PCSrc, immSrc, flagUpdate,
						output  logic [1:0]  aluControl);

						
//flagUpdate es un enable para actualizar o no las flags.						
	

always @(*)begin
case(opcode)

4'b0000:begin
	//mult solo con registros
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	//para que no hayan latches
	immSrc=1'b0;
	end

4'b0001:begin
	//mult con imm
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	//extensión de signo[7:0]
	immSrc=1'b0;
	flagUpdate=1'b1;
	end

4'b0010:begin
	//div solo con registros
	aluControl=2'b10;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	//para que no hayan latches
	immSrc=1'b0;
	end

4'b0011:begin
	//div con imm
	aluControl=2'b10;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	//extensión de signo[7:0]
	immSrc=1'b0;
	flagUpdate=1'b1;
	end

4'b0100:begin
	//suma
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	//para que no hayan latches
	immSrc=1'b0;
	end

4'b0101:begin
	//suma
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	//extensión de signo[7:0]
	immSrc=1'b0;
	flagUpdate=1'b1;
	end

//4'b0110:

//4'b0111:

//4'b1000:

//4'b1001:

//4'b1010:

//4'b1011:

//4'b1100:

//4'b1101:

//4'b1110:

//4'b1111:

default:begin 
	aluControl=2'b00;
	regWrite=1'b0;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	immSrc=1'b0;
	flagUpdate=1'b0;
	end

endcase

end	
endmodule

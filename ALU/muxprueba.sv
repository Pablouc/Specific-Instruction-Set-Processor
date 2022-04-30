module muxprueba #(parameter WIDTH=3)(input [WIDTH:0] a, input [WIDTH:0] b, input [1:0] opCode, input ci, 
													output logic [WIDTH:0] out, output logic co, negativo, cero, acarreo, desbordamiento);

logic [WIDTH:0] outMult;
logic [WIDTH:0] outDiv;
logic [WIDTH:0] outSum;
logic  coSum;




//Instanciando los modulos	

nbit_full_adder #(WIDTH) sum_instance(a,b,ci,outSum,coSum);


nbit_multiplier #(WIDTH) multInst(a,b,outMult);

nbit_divider #(WIDTH) divInst(a,b,outDiv);



////



always @(*)begin
case(opCode)



2'b00: begin
	out=outSum;
	//Bandera cero
	if(out==0) cero=1'b1;
	else if(out!=0) cero=1'b0;
	
	co=coSum;
	//Bandera acarreo
	if(co==1) acarreo=1'b1;
	else if(co==0) acarreo=1'b0;
	
	//Fijando banderas
	desbordamiento=1'b0;
	negativo=1'b0;
	end

2'b01: begin
	out=outMult;
	if(out==0) cero=1'b1;
	else if(out!=0) cero=1'b0;
	
	//Fijando banderas
	acarreo=1'b0;
	desbordamiento=1'b0;
	negativo=1'b0;
	
	end
	

2'b10: begin
	out=outDiv;
	if(out==0) cero=1'b1;
	else if(out!=0) cero=1'b0;
	
	//Fijando banderas
	acarreo=1'b0;
	desbordamiento=1'b0;
	negativo=1'b0;
	
	end




//2'b11: Esta libre

default:out=2'b00;


endcase

end	
endmodule

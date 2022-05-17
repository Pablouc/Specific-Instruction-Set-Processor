module Alu_tb();
parameter WIDTH=23;
logic [WIDTH:0] a;
logic [WIDTH:0] b;
logic [1:0] opCode;
logic [WIDTH:0] out;
logic ci, cero;

alu #(WIDTH) alu_instance(a,b,opCode,ci,out, cero);

initial begin
////////////Primer caso///////
a= 4'b0100;
b= 4'b0001;
ci=1'b0;
$display("*******resultados para a=b0000 y b=b0100*******");


opCode= 2'b00;
#5
if(out==4'b0101) $display("resultado correcto en SUMA: 1001");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");



#20
opCode= 2'b01;
#5
if(out==4'b0100) $display("resultado correcto en MULTIPLICACIÓN: 0100");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0100) $display("resultado correcto en DIVISION: 0100");
else $display("resultado incorrecto en DIVISION");


#20
opCode= 2'b11;
#5
if(out==4'b0011) $display("resultado correcto en RESTA: 0011");
else if(out!=4'b0011)$display("resultado incorrecto en RESTA");
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");


////////////Segundo caso//////////
#20
a= 4'b0101;
b= 4'b0101;
ci=1'b0;
$display("*******resultados para a=0101 y b=0101*******");

opCode= 2'b00;
#5
if(out==4'b1010) $display("resultado correcto en SUMA: 1010");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");

#20
opCode= 2'b01;
#5
if(out==6'b011001) $display("resultado correcto en MULTIPLICACIÓN: 0001");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0001) $display("resultado correcto en DIVISION: 0001");
else $display("resultado incorrecto en DIVISION");

#20
opCode= 2'b11;
#5
if(out==4'b0) $display("resultado correcto en RESTA: 0000");
else if(out!=4'b0)$display("resultado incorrecto en RESTA");
if(cero==1'b1) $display("cero correcto: Alto");
else if(cero==1'b0)$display("cero incorrecto");



end
endmodule

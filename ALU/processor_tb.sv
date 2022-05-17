`timescale 1 ps / 1 ps

module processor_tb();

logic clk, rst, enable; 
logic[15:0] pc;
logic [23:0]inst, result;
logic [39:0] data;
logic [39:0] memory [11:0];
logic [3:0] btn;
integer f, i;


processor procesador(clk, rst,btn, pc, inst,result, data,enable);


always #1 clk=~clk;

initial begin
clk<=0;
rst<=1;
btn<=4'b0001;

#1
rst<=0;

 f = $fopen("output.txt","w");

    @(negedge rst); //Wait for reset to be released
    @(posedge clk);   //Wait for fisrt clock out of reset
	
    for (i = 0; i<1200000; i=i+1) begin
      @(posedge clk);
      //memory[i] <= data;
      //$display("LFSR %b", data);
		
		if(enable) $fwrite(f,"%b\n",   data);
    end

    $fclose(f);  

    $finish;


//---------------------Pruebas de integración---------------------

//Instrucción ADDI R6, R6, 96    1111 0110 0110 0000 0110 0000

//#22
//if(result == 24'b01100000) $display("resultado correcto de ADDI R6, R6, 96");
//else if (result != 24'b01100000) $display("resultado incorrecto de ADDI R6, R6, 96");
//
//
////Instrucción MULT R6, R6, R6    0000 0110 0110 0110 0000 0000
//#10
//if(result == 24'b10010000000000) $display("resultado correcto de MULT R6, R6, R6");
//else if (result != 24'b10010000000000) $display("resultado incorrecto de MULT R6, R6, R6");
//
//
////Instrucción MULTI R6, R6, 4    0001 0110 0110 0000 0000 0100     
//#10
//if(result == 24'b01001000000000000) $display("resultado correcto de MULTI R6, R6, 4");
//else if (result != 24'b01001000000000000) $display("resultado incorrecto de MULTI R6, R6, 4");
//
//
////Instrucción LDR R7, #1         0101 0111 0000 0000 0000 0001
//#10
//if(result == 24'b1111) $display("resultado correcto de LDR R7, #1");
//else if (result != 24'b1111) $display("resultado incorrecto de LDR R7, #1");
//
//
////Instrucción STR R7, #1         0110 0111 0000 0000 0000 0001
//#10
//if(result == 24'b1111) $display("resultado correcto de STR R7, #1");
//else if (result != 24'b1111) $display("resultado incorrecto de STR R7, #1");
//
//
////Instrucción DIV R1, R1, #3     0011 0001 0001 0000 0000 0011 -----(R1 tiene 30)
//#100
//if(result == 24'b1010) $display("resultado correcto de DIV R1, R1, #3");
//else if (result != 24'b1010) $display("resultado incorrecto de DIV R1, R1, #3");
//
//
////Instrucción ADD R3, R2, R1     0100 0011 0010 0001 0000 0000 -----(R2+R1 = 10+48 = 58)
//#20
//if(result == 24'b00111010) $display("resultado correcto de ADD R3, R2, R1");
//else if (result != 24'b00111010) $display("resultado incorrecto de ADD R3, R2, R1");
//
//
////Instrucción BCND R6, R5, #17   1000 0000 0110 0101 0001 0001
//#792
//if(result == 24'b10001) $display("resultado correcto de BCND R6, R5, #17");
//else if (result != 24'b10001) $display("resultado incorrecto de BCND R6, R5, #17");


end


endmodule

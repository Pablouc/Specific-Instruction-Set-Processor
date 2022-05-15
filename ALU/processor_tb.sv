`timescale 1 ps / 1 ps

module processor_tb();

logic clk, rst, enable; 
logic[15:0] pc;
logic [23:0]inst;
logic [39:0] data;
logic [39:0] memory [11:0];
integer f, i;


processor procesador(clk, rst,pc, inst, data,enable);


always #0.5 clk=~clk;

initial begin
clk<=0;
rst<=1;

#0.5
rst<=0;

 f = $fopen("output.txt","w");

    @(negedge rst); //Wait for reset to be released
    @(posedge clk);   //Wait for fisrt clock out of reset
	
    for (i = 0; i<420; i=i+1) begin
      @(posedge clk);
      //memory[i] <= data;
      //$display("LFSR %b", data);
		
		if(enable) $fwrite(f,"%b\n",   data);
    end

    $fclose(f);  

    $finish;





end


endmodule

module WriteMemory(input logic clk,reset,input logic [39:0] data, output logic  [39:0] memory[11:0] );

  integer f,i;


  initial begin
   f = $fopen("output.txt","w");

    @(negedge reset); //Wait for reset to be released
    @(posedge clk);   //Wait for fisrt clock out of reset

    for (i = 0; i<11; i=i+1) begin
      @(posedge clk);
      memory[i] <= data;
      $display("LFSR %b", data);
      $fwrite(f,"%b\n",   data);
    end

    $fclose(f);  

    $finish;
  end
endmodule

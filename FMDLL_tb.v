`timescale 1ns/100ps
module FMDLL_tb();
    reg [1:0] Sel;
    reg [1:0] M;
    reg [3:0] N;
    reg clk_ext;
    reg rst_n;
    wire clk_out;    
    FMDLL u1(.M(M),
           .N(N),
           .clk_ext(clk_ext),
           .clk_out(clk_out),
           .rst_n(rst_n)
           );
  

    initial begin
      clk_ext= 1;
      N      = 4'd10;
      M      = 2'd3;
      rst_n  = 1;
      #10
      rst_n  = 0;
      #3000
      $finish;
    end

    always #(1 / 2) clk_ext = ~clk_ext;
    
    initial begin
   	$sdf_annotate("./FMDLL_syn.sdf", u1);
	$fsdbDumpfile("../4.Simulation_Result/FMDLL_syn.fsdb");
	$fsdbDumpvars;
end

endmodule

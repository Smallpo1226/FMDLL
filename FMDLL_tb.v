`timescale 1ns/100ps
module FMDLL_tb();
    reg [1:0] Sel;
    reg [1:0] M;
    reg [3:0] N;
    reg CLK_exit;
    reg rst_n;
    wire CLK_out;    
    PLL u1(.M(M),
           .N(N),
           .CLK_exit(CLK_exit),
           .CLK_out(CLK_out),
           .rst_n(rst_n)
           );
  

    initial begin
      CLK_exit= 1;
      N      = 4'd10;
      M      = 2'd3;
      rst_n  = 1;
      #10
      rst_n  = 0;
      #200
      $finish;
    end

    always #(1 / 2) CLK_exit = ~CLK_exit;
    
     initial begin
        $fsdbDumpfile("../4.Simulation_Result/FMDLL_rtl.fsdb");
        $fsdbDumpvars;
    end



endmodule
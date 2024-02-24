`include "FD_M.v"
`include "FD_N.v"
`include "Select_Logic.v"
module FMC (CLK_exit,CLK_out,rst_n,Sel,DIV_M,M_counter,N_counter,M,N);
input CLK_exit;
input CLK_out;
input rst_n;
input [1:0] M_counter;
input [3:0] N_counter;
input [1:0] M;
input [3:0] N;
output [1:0]Sel;
output DIV_M;

wire DIV_N;

FD_M F0(.M(M),.DIV_M(DIV_M),.CLK_exit(CLK_exit),.rst_n(rst_n),.M_counter(M_counter));
FD_N F1(.N(N),.DIV_N(DIV_N),.CLK_out(CLK_out),.rst_n(rst_n),.N_counter(N_counter));
Select_Logic F2(.DIV_N(DIV_N),.CLK_out(CLK_out),.CLK_exit(CLK_exit),.DIV_M(DIV_M),.M(M),.N(N),.N_counter(N_counter),.M_counter(M_counter),.Sel(Sel));



endmodule
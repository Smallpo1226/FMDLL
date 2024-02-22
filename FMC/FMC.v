module FMC (CLK_exit,CLK_out,rst_n,Sel,DIV_M);
input CLK_exit;
input CLK_out;
input rst_n;
output [1:0]Sel;
output DIV_M;

wire DIV_N;

FD_M F0(.M(M),.DIV_M(DIV_M),.CLK_exit(CLK_exit),.rst_n(rst_n));
FD_N F1(.N(N),.DIV_N(DIV_N),.CLK_out(CLK_out),.rst_n(rst_n));
Select_Logic F2(.DIV_N(DIV_N),.DIV_M(DIV_M),.Sel(Sel));






endmodule
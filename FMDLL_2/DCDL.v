`include "CDL.v"
`include "FDL.v"
module DCDL (clk_mid,Q,T,Tb,clk_out);
input clk_mid;
input [5:0] Q;
input [15:0] T;
input [15:0] Tb;
output clk_out;
wire [5:0] Qb;

assign Qb = ~Q;

CDL D1(.clk_mid(clk_mid),.T(T),.Tb(Tb),.clk_coarse_out(clk_coarse_out));
FDL D2(.clk_in(clk_coarse_out),.Q(Q),.Qb(Qb),.clk_out(clk_out));

endmodule
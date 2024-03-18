<<<<<<< HEAD
`include "CDL.v"
`include "FDL.v"
module DCDL (clk_mid,Q,T,Tb,clk_out,clk_coarse_out);
input clk_mid;
input [9:0] Q;
input [15:0] T;
input [15:0] Tb;
output clk_out;
output clk_coarse_out;
CDL D1(.clk_mid(clk_mid),.T(T),.Tb(Tb),.clk_coarse_out(clk_coarse_out));
FDL D2(.clk_in(clk_coarse_out),.Q(Q[5:0]),.clk_out(clk_out));

=======
`include "CDL.v"
`include "FDL.v"
module DCDL (clk_mid,Q,T,Tb,clk_out,clk_coarse_out);
input clk_mid;
input [9:0] Q;
input [15:0] T;
input [15:0] Tb;
output clk_out;
output clk_coarse_out;
CDL D1(.clk_mid(clk_mid),.T(T),.Tb(Tb),.clk_coarse_out(clk_coarse_out));
FDL D2(.clk_in(clk_coarse_out),.Q(Q[5:0]),.clk_out(clk_out));

>>>>>>> 7b9d4958bc09bc5df12fa10f94e0013a6d19da05
endmodule
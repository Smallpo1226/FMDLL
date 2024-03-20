`include "CDL.v"
`include "FDL.v"
module DCDL (clk_mid,Q,T,Tb,T_f1,Tb_f1,T_f2,Tb_f2,clk_out);
input clk_mid;
input [9:0] Q;
input [15:0] T, Tb;
input [7:0] T_f1, Tb_f1;
input [7:0] T_f2, Tb_f2;
output clk_out;
wire clk_coarse_out, clk_fine_out;
wire inv_in;
reg [9:0] Qb;

always @(*) begin
	Qb = ~Q;
end
CDL D1(.clk_mid(clk_mid),.T(T),.Tb(Tb),.clk_coarse_out(clk_coarse_out));
FDL D2(.clk_in(clk_coarse_out),.T(T_f1),.Tb(Tb_f1),.clk_out(clk_fine_out));
FDL D3(.clk_in(clk_fine_out),.T(T_f2),.Tb(Tb_f2),.clk_out(inv_in));
assign clk_out = ~inv_in;

endmodule
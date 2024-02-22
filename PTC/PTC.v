`include"HLD.v"
`include"PD.v"
`include"10bit_SAR.v"
`include"Clock_divider.v"
`include "4to16_Decoder.v"
module PTC (Sel,N,M,DIV_M,CLK_exit,CLK_out,Q,T,Tb,M_counter,N_counter,rst_n);
input [1:0] Sel;
input [1:0]M,M_counter;
input DIV_M;
input CLK_exit;
input CLK_out;
input [2:0] N,N_counter;
input rst_n;
output [9:0] Q;
output [15:0] T;
output [15:0] Tb;
wire clk2,clk4;
wire Reset_PD;
wire COMP;


Clock_divider P0(.M(M),.DIV_M(DIV_M),.CLK_exit(CLK_exit),.clk2(clk2),.clk4(clk4));
HLD P1(.clk2(clk2),.clk4(clk4),.Sel(Sel),.DIV_M(DIV_M),.M(M),.CLK_exit(CLK_exit),.Reset_PD(Reset_PD));
PD P2(.CLK_exit(CLK_exit),.CLK_out(CLK_out),.Reset_PD(Reset_PD),.COMP(COMP),.N_counter(N_counter),.M_counter(M_counter));
four_to_sixteen_Decoder P3(.rst_n(rst_n),.Q(Q[9:6]),.T(T),.Tb(Tb));
SAR P4(.COMP(COMP),.clk4(clk4),.rst_n(rst_n),.Q(Q));

endmodule
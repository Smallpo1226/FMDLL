`include "HLD.v"
`include "PD.v"
`include "10bit_SAR.v"
`include "Clock_divider.v"
`include "4to16_Decoder.v"
module PTC (Sel,N,M,DIV_M,clk_ext,clk_out,Q,T,Tb,M_counter,N_counter,rst_n,Q_next);
input [1:0] Sel;
input [1:0]M,M_counter;
input DIV_M;
input clk_ext;
input clk_out;
input [3:0] N,N_counter;
input rst_n;
output [9:0] Q;
output [9:0] Q_next;
output [15:0] T;
output [15:0] Tb;
wire clk2,clk4;
wire Reset_PD;
wire COMP;


Clock_divider P0(.rst_n(rst_n),.M(M),.DIV_M(DIV_M),.clk_ext(clk_ext),.clk2(clk2),.clk4(clk4));
HLD P1(.clk2(clk2),.clk4(clk4),.Sel(Sel[0]),.DIV_M(DIV_M),.M(M[0]),.clk_ext(clk_ext),.Reset_PD(Reset_PD),.rst_n(rst_n));
PD P2(.clk_ext(clk_ext),.clk_out(clk_out),.Reset_PD(Reset_PD),.COMP(COMP),.N_counter(N_counter),.M_counter(M_counter),.Q(Q),.Q_next(Q_next),.M(M),.N(N)/*,.rst_n(rst_n)*/);
Decoder4to16 P3(.rst_n(rst_n),.Q(Q[9:6]),.T(T),.Tb(Tb));
SAR P4(.COMP(COMP),.clk4(clk4),.rst_n(rst_n),.Q(Q),.Q_next(Q_next),.DIV_M(DIV_M));

endmodule

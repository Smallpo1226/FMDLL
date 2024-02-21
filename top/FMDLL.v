`include "..\PTC\PTC.v"
`include "..\FMC\FMC.v"
`include "..\DCDL\DCDL.v"
`include "ClK_COUNT.v"

module FMDLL (Sel,M,N,CLK_exit,CLK_out,rst_n);

input [1:0]Sel;
input [1:0]M;
input [2:0]N;
input rst_n;
wire [1:0]M_counter;
wire [2:0]N_counter;
wire DIV_m;
input CLK_exit;
output CLK_out;
wire [9:0] Q;

PTC U0( .Sel(Sel),   .M(M),  .DIV_m(DIV_m),  .CLK_exit(CLK_exit),    .CLK_out(CLK_out),  .Q(Q) ,.N_counter(N_counter),.M_counter(M_counter));
FMC U1();
DCDL U2();
ClK_COUNT U3(.CLK_exit(CLK_exit),.CLK_out(CLK_out),.N_counter(N_counter),.M_counter(M_counter),.rst_n(rst_n));

endmodule
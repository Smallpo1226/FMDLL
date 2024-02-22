`include "..\PTC\PTC.v"
`include "..\FMC\FMC.v"
`include "..\DCDL\DCDL.v"
`include "ClK_COUNT.v"

module FMDLL (Sel,M,N,CLK_exit,CLK_out,rst_n);

input [1:0]Sel;
input [1:0]M;
input [2:0]N;
input rst_n;
input CLK_exit;
output CLK_out;
wire [1:0]M_counter;
wire [2:0]N_counter;
wire DIV_m;

reg clk_mid;
wire [9:0] Q;

PTC U0( .Sel(Sel),   .M(M),  .DIV_m(DIV_m),  .CLK_exit(CLK_exit),    .CLK_out(CLK_out),  .Q(Q) ,.N_counter(N_counter),.M_counter(M_counter));
FMC U1(.CLK_exit(CLK_exit),.CLK_out(CLK_out),.rst_n(rst_n),.Sel(Sel),.DIV_M(DIV_M));
DCDL U2(.clk_mid(clk_mid),.Q(Q),.T(T),.Tb(Tb),.clk_out(clk_out));
ClK_COUNT U3(.CLK_exit(CLK_exit),.CLK_out(CLK_out),.N_counter(N_counter),.M_counter(M_counter),.rst_n(rst_n));

always@* begin
    case (Sel)
        2'b00: clk_mid = CLK_out;
        2'b01: clk_mid = CLK_exit;
        2'b10: clk_mid = 0;
        default: clk_mid = CLK_out;
    endcase
end
endmodule
`include "PTC.v"
`include "FMC.v"
`include "DCDL.v"
`include "ClK_COUNT.v"

module FMDLL (M,N,clk_ext,clk_out,rst_n,Sel);


input [1:0]M;
input [3:0]N;
input rst_n;
input clk_ext;
output clk_out;
wire [1:0]M_counter;
wire [3:0]N_counter;
wire DIV_M;
output reg [1:0] Sel;
reg clk_mid;
wire [9:0] Q, Q_next;
wire [15:0] T,Tb;

PTC U0( .Sel(Sel),.N(N),   .M(M),  .DIV_M(DIV_M),  .clk_ext(clk_ext),    .clk_out(clk_out),  .Q(Q) ,.Q_next(Q_next),.T(T),.Tb(Tb),.N_counter(N_counter),.M_counter(M_counter),.rst_n(rst_n));
FMC U1(.clk_ext(clk_ext),.clk_out(clk_out),.rst_n(rst_n),.Sel(Sel),.DIV_M(DIV_M),.M_counter(M_counter),.N_counter(N_counter),.M(M),.N(N));
DCDL U2(.clk_mid(clk_mid),.Q(Q),.T(T),.Tb(Tb),.clk_out(clk_out),.clk_coarse_out(clk_coarse_out));
ClK_COUNT U3(.clk_ext(clk_ext),.clk_out(clk_out),.N_counter(N_counter),.M_counter(M_counter),.M(M),.N(N),.rst_n(rst_n),.Sel(Sel[0]));

always@* begin
    if(~rst_n) begin
        clk_mid = clk_ext;
    end else begin
		case (Sel)
			2'b00: clk_mid = clk_out;
			2'b01: clk_mid = clk_ext;
			2'b10: clk_mid = 1;
			default: clk_mid = clk_ext;
		endcase
    end
end

endmodule

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
wire DIV_M, DIV_N;
output reg [1:0] Sel;
reg clk_mid;
wire [9:0] Q, Q_next;
wire [15:0] T,Tb;
wire [7:0] T_f1, Tb_f1;
wire [7:0] T_f2, Tb_f2;
wire clk_out_tmp;
wire clk_ext_dummy;
PTC U0( .Sel(Sel),.N(N),   .M(M),  .DIV_M(DIV_M),.DIV_N(DIV_N),  .clk_ext(clk_ext),    .clk_out(clk_out),  .Q(Q) ,.Q_next(Q_next),.T(T),.Tb(Tb),.T_f1(T_f1),.Tb_f1(Tb_f1),.T_f2(T_f2),.Tb_f2(Tb_f2),.N_counter(N_counter),.M_counter(M_counter),.rst_n(rst_n));
FMC U1(.clk_ext(clk_ext),.clk_out(clk_out),.rst_n(rst_n),.Sel(Sel),.DIV_M(DIV_M),.DIV_N(DIV_N),.M_counter(M_counter),.N_counter(N_counter),.M(M),.N(N));
DCDL U2(.clk_mid(clk_mid),.Q(Q),.T(T),.Tb(Tb),.T_f1(T_f1),.Tb_f1(Tb_f1),.T_f2(T_f2),.Tb_f2(Tb_f2),.clk_out(clk_out_tmp),.Sel(Sel),.clk_ext(clk_ext)   ,.clk_out_out(clk_out));
ClK_COUNT U3(.clk_ext(clk_ext),.clk_out(clk_out),.N_counter(N_counter),.M_counter(M_counter),.M(M),.N(N),.rst_n(rst_n),.Sel(Sel[0]));


always@* begin
    /*if(~rst_n) begin
        clk_mid = clk_ext;
    end else begin*/
		case (Sel)
			2'b00: clk_mid = clk_out;
			2'b01: clk_mid = clk_ext;
			2'b10: clk_mid = 1;
			default: clk_mid = clk_ext;
		endcase
    //end
end 
//reg false;
//BUFX20 DUMMY0(.A(clk_ext),.Y(clk_ext_dummy));
assign clk_out = (Sel == 2'b10||(Sel == 2'b01 && clk_ext == 1'b1 && clk_out==1'b0)/*||false == 1*/) ? 0:clk_out_tmp;

/*always @(posedge clk_ext)begin
	if(clk_out==1 && clk_out_tmp==1) begin
		false <= 0;
	end else if(clk_out==0 && clk_out_tmp==1) begin
		false <= 1;
	end else begin
		false <= 0;
	end
end*/

endmodule

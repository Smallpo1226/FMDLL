`include "FDE.v"
module FDL (
    input clk_in,
    input [5:0] Q,
    input [5:0] Qb,
    output clk_out
);
INVXL I1(.A(clk_in),.Y(connect));
INVXL I2(.A(connect),.Y(clk_out));
FDE X1 (.Q(Q[0]),.Qb(Qb[0]),.connect(connect),.feedback(clk_out));
FDE X2 (.Q(Q[1]),.Qb(Qb[1]),.connect(connect),.feedback(clk_out));
FDE X4 (.Q(Q[2]),.Qb(Qb[2]),.connect(connect),.feedback(clk_out));
FDE X8 (.Q(Q[3]),.Qb(Qb[3]),.connect(connect),.feedback(clk_out));
FDE X16(.Q(Q[4]),.Qb(Qb[4]),.connect(connect),.feedback(clk_out));
FDE X32(.Q(Q[5]),.Qb(Qb[5]),.connect(connect),.feedback(clk_out));

endmodule
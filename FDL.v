module FDL (
    input [5:0] Q,
    input clk_in,
    output clk_out
);

    wire inv_in, inv_out;
    wire [5:0] dummy_wire;
    reg [6:0] Code;
	
	always @(*) begin
		begin case (Q) 
			6'b000000 : Code = 7'b0000001;
			6'b100000 : Code = 7'b0000010;
			6'b110000 : Code = 7'b0000100;
			6'b111000 : Code = 7'b0001000;
			6'b111100 : Code = 7'b0010000;
			6'b111110 : Code = 7'b0100000;
			6'b111111 : Code = 7'b1000000;
			default : Code = 7'b1000000;
		endcase end
	end
	
    TBUFX20 F1 (.A(clk_in), .OE(Code[6]), .Y(inv_in));
    TBUFX16 F2 (.A(clk_in), .OE(Code[5]), .Y(inv_in));
    TBUFX12 F3 (.A(clk_in), .OE(Code[4]), .Y(inv_in));
    TBUFX8 F4 (.A(clk_in), .OE(Code[3]), .Y(inv_in));
    TBUFX6 F5 (.A(clk_in), .OE(Code[2]), .Y(inv_in));
    TBUFX4 F6 (.A(clk_in), .OE(Code[1]), .Y(inv_in));
	TBUFX3 F0 (.A(clk_in), .OE(Code[0]), .Y(inv_in));
	BUFX2 F7 (.A(clk_in), .Y(inv_in));
	//BUFX2 F8 (.A(clk_in), .Y(inv_in));
    assign inv_out = ~inv_in;
    assign clk_out = inv_out;

endmodule

<<<<<<< HEAD
module FDL (
    input [5:0] Q,
    input clk_in,
    output clk_out
);

    wire inv_in, inv_out;
    wire dummy_wire;
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
    /*TBUFX20 F1 (.A(clk_in), .OE(Code[6]), .Y(inv_in));
    TBUFX16 F2 (.A(clk_in), .OE(Code[5]), .Y(inv_in));
    TBUFX12 F3 (.A(clk_in), .OE(Code[4]), .Y(inv_in));
    TBUFX8 F4 (.A(clk_in), .OE(Code[3]), .Y(inv_in));
    TBUFX6 F5 (.A(clk_in), .OE(Code[2]), .Y(inv_in));
    TBUFX4 F6 (.A(clk_in), .OE(Code[1]), .Y(inv_in));
	TBUFX3 F0 (.A(clk_in), .OE(Code[0]), .Y(inv_in));
	BUFX2 F7 (.A(clk_in), .Y(inv_in));
	//BUFX2 F8 (.A(clk_in), .Y(inv_in));
    assign inv_out = ~inv_in;
    assign clk_out = inv_out;*/
	NAND2X2 F1 (.A(clk_in), .B(Code[6]), .Y(dummy_wire));
	NAND2X2 F2 (.A(clk_in), .B(Code[5]), .Y(dummy_wire));
    NAND2X2 F3 (.A(clk_in), .B(Code[4]), .Y(dummy_wire));
    NAND2X2 F4 (.A(clk_in), .B(Code[3]), .Y(dummy_wire));
    NAND2X2 F5 (.A(clk_in), .B(Code[2]), .Y(dummy_wire));
    NAND2X2 F6 (.A(clk_in), .B(Code[1]), .Y(dummy_wire));
	NAND2X2 F0 (.A(clk_in), .B(Code[0]), .Y(dummy_wire));
    
	assign inv_out = ~clk_in;
	assign clk_out = inv_out;

endmodule
    /*TBUFX20 F1 (.A(clk_in), .OE(Code[6]), .Y(inv_in));
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

/*module FDL (
    input [5:0] Q,
    input clk_in,
    output reg clk_out
);
	reg inv1,inv2,inv3,inv4,inv5,inv6;
    reg inv_out1,inv_out1_tmp,clk_out_tmp;
	CLKINVX1 INV1(.A(clk_out),.Y(inv1));
	CLKINVX2 INV2(.A(clk_out),.Y(inv2));
	CLKINVX4 INV3(.A(clk_out),.Y(inv3));
	CLKINVX8 INV4(.A(clk_out),.Y(inv4));
	CLKINVX16 INV5(.A(clk_out),.Y(inv5));
	CLKINVX20 INV6(.A(clk_out),.Y(inv6));			

	always@*begin
		
		case(Q) 
			6'b000001:	inv_out1 = inv1;
			6'b000010:	inv_out1 = inv2;
			6'b000100:	inv_out1 = inv3;
			6'b001000:	inv_out1 = inv4;
			6'b010000:	inv_out1 = inv5;
			6'b100000:	inv_out1 = inv6;
		default:		inv_out1 = inv_out1_tmp;
		
	endcase
	end
	always@* begin
		inv_out1_tmp = inv_out1;
	end

	CLKINVX20 INV0(.A(clk_in),.Y(inv_out1));
	CLKINVX20 INV7(.A(inv_out1),.Y(clk_out_tmp));
	CLKINVX1 INV8(.A(clk_out_tmp),.Y(clk_out));
endmodule*/
=======
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
>>>>>>> 7b9d4958bc09bc5df12fa10f94e0013a6d19da05

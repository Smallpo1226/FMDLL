<<<<<<< HEAD
module HLD_Ctrl1 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    output  Ctrl_HLD1
);
    wire clk_nand;
    wire Ctrl_HLD1_tmp1,Ctrl_HLD1_tmp2;
    wire clk4b;

    NAND2XL H7(.A(clk2),.B(clk4),.Y(clk_nand));
    NOR2XL H8(.A(clk_nand),.B(DIV_M),.Y(Ctrl_HLD1_tmp1));
    INVXL H9(.A(clk4),.Y(clk4b));
    NOR2XL H10(.A(clk4b),.B(clk2),.Y(Ctrl_HLD1_tmp2));
    assign Ctrl_HLD1 = M ? Ctrl_HLD1_tmp2:Ctrl_HLD1_tmp1;
=======
module HLD_Ctrl1 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    output  Ctrl_HLD1
);
    wire clk_nand;
    wire Ctrl_HLD1_tmp1,Ctrl_HLD1_tmp2;
    wire clk4b;

    NAND2XL H7(.A(clk2),.B(clk4),.Y(clk_nand));
    NOR2XL H8(.A(clk_nand),.B(DIV_M),.Y(Ctrl_HLD1_tmp1));
    INVXL H9(.A(clk4),.Y(clk4b));
    NOR2XL H10(.A(clk4b),.B(clk2),.Y(Ctrl_HLD1_tmp2));
    assign Ctrl_HLD1 = M ? Ctrl_HLD1_tmp2:Ctrl_HLD1_tmp1;
>>>>>>> 7b9d4958bc09bc5df12fa10f94e0013a6d19da05
endmodule
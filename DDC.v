module DDC (
    input I,
    input T,
    input Tb,
    input P2,
    output O,
    output P1
);
    wire dummy, before_P1;
    wire A1toA3;
    NAND2X2 A0(.A(I), .B(Tb), .Y(before_P1));
    BUFX2 B0(.A(before_P1), .Y(P1));
    NAND2X2 A1(.A(I), .B(T), .Y(A1toA3));
    NAND2X2 A2(.A(A1toA3), .B(P2), .Y(dummy));
    NAND2X2 A3(.A(P2), .B(A1toA3), .Y(O));
endmodule
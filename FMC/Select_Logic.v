module Select_Logic (
    input DIV_N,
    input DIV_M,
    output reg [1:0] Sel
);

    always @* begin
        case({DIV_N,DIV_M})
            2'b00:
                Sel = 2'b01;
            2'b01:
                Sel = 2'b10;
            2'b10:
                Sel = 2'b01;
            2'b11:
                Sel = 2'b00;
    
    default: Sel = 2'b00;
    endcase
    end

endmodule
module Decoder4to16 (
    input rst_n,
    input [3:0] Q,
    output reg [15:0] T,
    output  [15:0] Tb
);
    always @(*) begin
        if (!rst_n ) begin
            T = 16'b0000000000000000;
        end
        else begin
            case (Q[3:0])
                4'd0: T = 16'b0000000000000001;
                4'd1: T = 16'b0000000000000010;
                4'd2: T = 16'b0000000000000100;
                4'd3: T = 16'b0000000000001000;
                4'd4: T = 16'b0000000000010000;
                4'd5: T = 16'b0000000000100000;
                4'd6: T = 16'b0000000001000000;
                4'd7: T = 16'b0000000010000000;
                4'd8: T = 16'b0000000100000000;
                4'd9: T = 16'b0000001000000000;
                4'd10: T = 16'b0000010000000000;
                4'd11: T = 16'b0000100000000000;
                4'd12: T = 16'b0001000000000000;
                4'd13: T = 16'b0010000000000000;
                4'd14: T = 16'b0100000000000000;
                4'd15: T = 16'b1000000000000000;
                default : T = 16'b0000000000000001;
            endcase
        end 
    end

    assign Tb = ~T;

endmodule

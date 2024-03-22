module HLD (
    input CLK_EXT,  // External clock signal
    input CLK_OUT,  // Internal clock signal
    input Sel0,     // Selection signal for mode detection
    output reg Reset_PD // Reset signal for phase detector 
);

reg [1:0] state; // State variable to track the detector state

always @ (*) begin
    // Detect harmonic lock condition
    if (CLK_EXT) begin
        if (~CLK_OUT) begin
            if (Sel0 == 1'b1) begin
                if (state == 2'b00) begin
                    state <= 2'b01; // Set state to indicate potential harmonic lock
                end
            end
        end
    end else begin
        state <= 2'b00; // Reset state
    end
end

// Output logic based on state
always @ (*) begin
    case (state)
        2'b01: begin
            Reset_PD = 1'b1; // Generate reset signal for phase detector// Reduce MSB of SAR to adjust DCDL delay
        end
        default: begin
            Reset_PD = 1'b0; // Reset signal inactive
        end
    endcase
end

endmodule
module DFF(
  input CK,
  input SET,
  input D,
  output reg Q
);
  always @(posedge CK or posedge SET) begin
    if (SET) begin
      Q = 1;
    end else begin
      Q = D; 
    end
  end

endmodule
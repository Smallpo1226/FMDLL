module D_latch (
  input  en,
  input  d,
  output q
);

assign q = (en) ? d : q;
endmodule
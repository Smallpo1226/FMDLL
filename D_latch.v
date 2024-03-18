<<<<<<< HEAD
module D_latch (
  input  en,
  input  d,
  output q,
  input rst_n
);
  assign q = (rst_n) ? ((en) ? d : q) : 0;
=======
module D_latch (
  input  en,
  input  d,
  output q,
  input rst_n
);
  assign q = (rst_n) ? ((en) ? d : q) : 0;
>>>>>>> 7b9d4958bc09bc5df12fa10f94e0013a6d19da05
endmodule
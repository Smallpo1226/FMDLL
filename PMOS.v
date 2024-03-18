module PMOS (
    input gate,
    input source,
	output drain
);

    assign drain = gate ? source : 0;

endmodule
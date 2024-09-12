module sign_extender(
	input		[15:0]	immediate_in,
	input			extend_enable,
	output	reg	[31:0]	extend_out_D
);

always @(*) begin
	if(extend_enable)
		extend_out_D = {{16{immediate_in[15]}}, immediate_in};
end

endmodule 
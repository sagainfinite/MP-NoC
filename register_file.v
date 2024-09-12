module register_file(
	input		clk,
	input	[4:0]	rs, 	// source add.1
	input	[4:0]	rt,	// source add.2
	input	[4:0]	rd,	// destination add
	input 	[31:0]	wd,	// write data into reg_array
	input		we,	// write enable
	output	[31:0]	rd1,	// outputs data corresponding to add.1 
	output	[31:0]	rd2	// outputs data corresponding to add.2
);

reg [31:0] reg_array [31:0];

always @(posedge clk) begin
	if(we) begin
		reg_array[rd] <= wd;
	end
end

assign rd1 = (rs == 5'd0) ? 32'b0 : reg_array[rs];	// first reg in reg_array is a zero register
assign rd2 = (rt == 5'd0) ? 32'b0 : reg_array[rd];

endmodule	
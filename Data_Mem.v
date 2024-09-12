module Data_Mem(
	input			clk,
	input			Write_Data_M,
	input		[31:0]	ALU_result_M,
	input		[31:0]	mem_write_M,
	output	reg	[31:0]	mem_read_M
);

reg [31:0] memory [0:15];

always @(posedge clk) begin
	if(Write_Data_M)
		memory[ALU_result_M]	<= mem_write_M;

	else if(!Write_Data_M)
		mem_read_M	<= memory[ALU_result_M];
	
	else
		mem_read_M <= 31'dx;
end

endmodule

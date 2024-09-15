module ID_EX(
	input			clk,
	input			Jump_D,
	input			Branch_D,
	input			RegW_enable_D,
	input			ALU_src_D,
	input		[3:0]	ALU_control_D,
	input			Mem_Write_D,
	input			Mem_Read_D,
	input			Result_src_D,
	input		[31:0]	rd1,
	input		[31:0]	rd2,
	input		[4:0]	Radd_D,
	input		[31:0]	extend_out_D,
	input		[31:0]	PC_D,
	output	reg		Jump_E,
	output	reg		Branch_E,
	output	reg		RegW_enable_E,
	output	reg		ALU_src_E,
	output	reg	[3:0]	ALU_control_E,
	output	reg		Mem_Write_E,
	output	reg		Mem_Read_E,
	output	reg		Result_src_E,
	output	reg	[31:0]	rd1_E,
	output	reg	[31:0]	rd2_E,
	output	reg	[4:0]	Radd_E,
	output	reg	[31:0]	PC_E,
	output	reg	[31:0]	extend_out_E
);

always @(posedge clk) begin
	Jump_E		<= Jump_D;
	Branch_E	<= Branch_D;
	RegW_enable_E	<= RegW_enable_D;
	ALU_src_E	<= ALU_src_D;
	ALU_control_E	<= ALU_control_D;
	Mem_Write_E	<= Mem_Write_D;
	Result_src_E	<= Result_src_D;
	rd1_E		<= rd1;
	rd2_E		<= rd2;
	Radd_E		<= Radd_D;
	PC_E		<= PC_D;
	extend_out_E	<= extend_out_D;
end

endmodule

	
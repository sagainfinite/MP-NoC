module control_unit(
	input		[5:0]	opcode,
	input		[5:0]	fun,
	input		[25:0]	target,
	output	reg		Jump_D,
	output	reg		Branch_D,
	output 	reg		RegW_enable_D,
	output	reg		Extend_enable_D,
	output	reg		ALU_src_D,
	output	reg	[3:0]	ALU_control_D,
	output	reg		Mem_Write_D,
	output	reg		Result_src_D
);

localparam
	lw 	= 6'b100000,
	sw 	= 6'b100001,
	beq 	= 6'b100010,
	bne 	= 6'b100011,
	addi	= 6'b100100,
	andi 	= 6'b100101,
	ori	= 6'b100110,
	slti	= 6'b100111,
	
	Jtype	= 6'b000000,
	
	Rtype	= 6'b110000,
	and_R 	= 6'b000000,
	or_R 	= 6'b000001,
	nor_R 	= 6'b000010,
	xor_R 	= 6'b000011,
	add_R 	= 6'b000100,
	sub_R 	= 6'b000101,
	mul_R 	= 6'b000110,
	slt_R 	= 6'b000111,
	sll_R 	= 6'b001000,
	sgt_R 	= 6'b001001,
	clo_R 	= 6'b001010,
	rotr_R 	= 6'b001011,
	sltu_R	= 6'b001100,
	sign_R 	= 6'b001101;

always @(*) begin
	Jump_D		= 0; //PC_src = 1;
	Branch_D	= 0;
	RegW_enable_D 	= 0;
	Extend_enable_D	= 0;
	ALU_src_D	= 0;
	ALU_control_D	= 0;
	Mem_Write_D	= 0;
	Result_src_D	= 0;

	case(opcode)
		Rtype: begin
			RegW_enable_D = 1;
			ALU_src_D = 0;
			ALU_control_D = fun[3:0];
			Result_src_D = 0;
			end
		
		lw: begin
			RegW_enable_D = 1;
			Extend_enable_D = 1;
			ALU_src_D = 1;
			ALU_control_D = 4'b0000; //add
			Result_src_D = 1;
			end

		sw: begin
			Extend_enable_D = 1;
			ALU_src_D = 1;
			ALU_control_D = 4'b0000; //add
			Mem_Write_D = 1'bx;
			Result_src_D = 1'bx;
			end
		
		beq: begin
			Extend_enable_D = 1;
			ALU_src_D = 0;
			ALU_control_D = 4'b0001; // Compare
			//PC_Src =1;
			Mem_Write_D	= 1'bx;
			Result_src_D = 1'bx;
			end
		
		bne: begin
			Extend_enable_D = 1;
			ALU_src_D = 0;
			ALU_control_D = 4'b0001;
			Mem_Write_D	= 1'bx;
			//PC_scr = 1;
			Result_src_D = 1'bx;
			end
	
		addi: begin
			Extend_enable_D = 1;
			RegW_enable_D = 1;
			ALU_src_D = 1;
			ALU_control_D = 4'b0000;
			Result_src_D = 0;
			end
		
		andi: begin
			Extend_enable_D = 1;
			RegW_enable_D = 1;
			ALU_src_D = 1;
			ALU_control_D = 4'b0000;
			Result_src_D = 0;
			end
		
		ori: begin
			Extend_enable_D = 1;
			RegW_enable_D = 1;
			ALU_src_D = 1;
			ALU_control_D = 4'b0000;
			Result_src_D = 0;
			end
		
		Jtype: begin
			Extend_enable_D = 1;
			ALU_control_D = 4'bxxxx;
			Mem_Write_D	= 1'bx;
			Result_src_D = 1'bx;
			end
			
		default: begin
			Jump_D		= 1'bx; 
			Branch_D	= 1'bx;
			RegW_enable_D 	= 1'bx;
			Extend_enable_D	= 1'bx;
			ALU_src_D	= 1'bx;
			ALU_control_D	= 1'bx;
			Mem_Write_D	= 1'bx;
			Result_src_D	= 1'bx;
			end
	endcase
end
		
endmodule
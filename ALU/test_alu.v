//test ALU
module test_ALU 
#(parameter MEMWIDTH = 32)
();
reg [MEMWIDTH-1:0] memory[15:0], input_a[15:0], input_b[15:0], operation[15:0];
reg clk;
reg [3:0] address;
wire [31:0] a, b;
wire [31:0] r;
wire [4:0] shamt;
wire [3:0] alu_ctrl;
wire z;
wire [31:0] expected;


assign b = input_b[address][31:0];
assign a = input_a[address][31:0];
assign expected = memory[address][31:0];
assign alu_ctrl = operation[address][3:0];
assign shamt = operation[address][8:4];
initial
begin
	$readmemh("expected.txt", memory);
	$readmemh("input_a.txt", input_a);
	$readmemh("input_b.txt", input_b);
	$readmemh("operation.txt", operation );
	clk = 0;
	address = 0;
	#135 $stop;
end

always begin
#5 clk = ~clk;
end

always @(posedge clk) begin

	address <= address + 1;	
	if(expected !== r)
		$error("a=%h, b=%h, alu_control =%h received =%h ,expected = %h\n",a, b, alu_ctrl ,r, expected);
	else
		$display($time, " correct results a=%h, b=%h , result=%h\n", a, b,r);
	
	
end

ALU dut(
	.a (a),
	.b (b),
	.alu_ctrl(alu_ctrl),
	.shamt(shamt),
	.result (r),
	.zout(z)
);

endmodule


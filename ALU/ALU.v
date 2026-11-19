//ALU 
module ALU 
(input wire [31:0] a,
 input wire [31:0] b,
 input wire [3:0] alu_ctrl, //instruction type
 input wire [4:0] shamt, //shift amount
 output wire [31:0] result,
 output wire zout // zero flag
);

//declare neccesary registers or wires
reg [31:0] final_out;
always @(*) begin
	case(alu_ctrl)
		4'b0000: final_out = a + b; //add
		4'b0010: final_out = a - b; //sub
		4'b0100: final_out = a & b; //and
		4'b0101: final_out = ~(a | b); //nor	
		4'b1010: final_out = b << shamt; //sll 
		4'b1011: final_out = b >> shamt; //srl
		default: final_out = 32'bx; //default case
	endcase
end

assign result = final_out;
assign zout = (final_out == 32'b0); //set zero flag T : F case
// if result = 0, zout = 1 --> if result != 0, zout = 0 

endmodule

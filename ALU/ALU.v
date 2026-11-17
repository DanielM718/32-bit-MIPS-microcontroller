//ALU 
module ALU 
(input wire [31:0] a,
 input wire [31:0] b,
 input wire [3:0] alu_ctrl,
 input wire [4:0] shamt,
 output wire [31:0] result,
 output wire zout
);

//declare neccesary registers or wires
always @(*) begin
	case(alu_ctrl) 	
	endcase
end


endmodule

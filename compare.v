module compare(clk,rst,a,b,out);
input clk;
input rst;
input [31:0] a;
input [31:0] b;
output [31:0] out; //返回(a > b) ? 3f800000 : 

reg [7:0] pow_a;
reg [7:0] pow_b;
reg [22:0] val_a;
reg [22:0] val_b;
reg flag_a;
reg flag_b;
reg flag_same,flag_big,flag_small;
reg [31:0] out_reg;

always @(*) begin
	pow_a = a[30:23];
	pow_b = b[30:23];
	val_a = a[22:0];
	val_b = b[22:0];
	flag_a = a[31];
	flag_b = b[31];
	flag_same = (flag_a == flag_b ) ? 1'b1 : 1'b0;
	flag_big = ((flag_a == 1'b0 )&(flag_b == 1'b1)) ? 1'b1 : 1'b0;
	flag_small = ((flag_a == 1'b1 )&(flag_b == 1'b0)) ? 1'b1 : 1'b0;
	if (flag_big) out_reg = 32'h3f800000;
	if (flag_small) out_reg = 32'h33d6bf95;
	if (flag_same) begin
	
	if (pow_a == pow_b) begin
	if (val_a == val_b) out_reg = 32'h33d6bf95;
	else if(val_a > val_b) begin
		out_reg = flag_a ? 32'h33d6bf95 : 32'h3f800000;
	end
	else begin
		out_reg = flag_a ? 32'h3f800000 : 32'h33d6bf95;
	end
	end
	
	else if(pow_a > pow_b) begin
		out_reg = flag_a ? 32'h33d6bf95 : 32'h3f800000;
	end
	
	else begin
		out_reg = flag_a ? 32'h3f800000 : 32'h33d6bf95;
	end
	
	end
end

assign out = out_reg;
endmodule

`timescale 1ns/1ns

module tb();

reg clk;
initial clk=0;
always #1 clk = ~clk;

reg [31:0] rnd1mem [0:999];
reg [31:0] rnd2mem [0:999];

reg [10:0]addr;

wire [31:0] out;
wire [31:0] a,b;
integer file1;
initial begin
       $readmemh("E:/CASIA/SNN_RL-co/code_part/verification_compare/rnd1hex.txt",rnd1mem);
		 $readmemh("E:/CASIA/SNN_RL-co/code_part/verification_compare/rnd2hex.txt",rnd2mem);
		 file1 = $fopen("E:/CASIA/SNN_RL-co/code_part/verification_compare/compare.txt","w");
		 addr=0;


end

initial
        begin            
            $dumpfile("tb.vcd");
            $dumpvars(0,tb);
        end

always@(posedge clk)
begin
	$fwrite(file1,"%h\n",out);
	addr = addr + 1;
	if (addr > 999) begin
		$fclose(file1);
		$stop;
	end
end
assign a =rnd1mem[addr];
assign b =rnd2mem[addr];

compare c1(clk,rst,a,b,out);
endmodule



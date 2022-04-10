`timescale 1ns/1ns
module filter_original_test;

	reg clk;
	reg rst;
	reg[9:0] data_in;
	wire[23:0] data_out;
	////////
	reg[9:0] in[1000:0];
	integer i, fp_w;
	reg[23:0] out[1000:0];
	filter_original u(
		.clk(clk),
		.rst(rst),
		.data_in(data_in),
		.data_out(data_out));
	
	initial
	begin
		$readmemb("./input.txt", in);
		fp_w = $fopen("./data_out.txt","w");
		i=0;
		clk=0;
		rst=1;
	end
	
	always #10 clk=~clk;
	
	always @(posedge clk)
	begin
		data_in<=in[i];
		out[i]<=data_out;
		$fwrite(fp_w, "%b\n",data_out);//write
		i=i+1;
		if(i==1001) $fclose(fp_w);
	end
endmodule
`timescale 1ns/10ps
module lpf_top_tb();

parameter in_length = 3200;
parameter out_length = 3200;

reg clk_in;
reg reset_in;
reg dump_en;

wire [8:0] O_data;
reg [8:0] mat_in [1:in_length];
reg [8:0] I_data;

reg [8:0] mat_out [1:out_length];

reg [15:0] vindex;
reg [15:0] out_index;
reg [15:0] error;

integer  outputchannel;

initial
begin
  $display("Reading in matlab input vector file");
  $readmemh("./lpf_mat_in.hex", mat_in);
  $display("Reading in matlab output vector file");
  $readmemh("./lpf_mat_out.hex", mat_out);
  $display("writting verilog output vector file");
  outputchannel=$fopen("verilog_out.hex");
  vindex=0;
  out_index=0;
  error=0;
  clk_in=0;
  reset_in=1'b1;

  #2000
  reset_in=0;

end

initial
begin
dump_en = 0;
repeat (4) @(negedge clk_in);
dump_en = 1;
end

always #200 clk_in = ~clk_in;


always @ (posedge clk_in)
  begin
    vindex <= vindex+1;
	if (vindex==in_length)
	  begin
	  $display ("data path error = %d", error);
      $finish;
      end
  end

always @ (negedge clk_in or posedge reset_in)
  if (reset_in)
	 I_data <= 0;
  else
	 I_data <= mat_in[((vindex)%in_length)+1];

lpf_top ilpf_top (
	    // outputs
		.O_data(O_data),

		// inputs
		.I_clk(clk_in),
		.I_reset(reset_in),
		.I_data(I_data)
	);

reg signed [8:0] out_data;

always @ (posedge clk_in or posedge reset_in)
  if (reset_in)
	 out_data <= 0;
  else
	 out_data <= O_data;
/*
 always @ (posedge clk_in)
  if (dump_en)
	  $fwrite(outputchannel,"%3x\n",out_data);
*/

 always @ (posedge clk_in)
  if (dump_en)
  begin
	if (out_data !== mat_out[out_index+1])
	begin
	$display ("Error occurs at %d", out_index+1);
	$display ("Verilog output is %x, matlab output is %x", out_data, mat_out[out_index+1]);
	error = error + 1;
    end
    out_index <= out_index + 1;
  end


initial
begin
  $shm_open("lpf_top_tb.shm");
  $shm_probe(lpf_top_tb, "AC");
end

endmodule
	




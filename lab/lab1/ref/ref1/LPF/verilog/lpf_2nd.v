module lpf_2nd (
				I_clk,
				I_reset,
				I_data,
				O_data
				);

parameter in_width = 12;
parameter out_width = 15;
parameter coeffa_width = 11;
parameter coeffb_width = 10;

wire signed [coeffa_width:0] a1 = -'sd1348;
wire signed [coeffa_width:0] a2 =  'sd882;
wire signed [coeffb_width:0] b1 = -'sd788;

// a0=b0=b2=1 in this filter

input I_clk, I_reset;
input signed [in_width:0] I_data;
output signed [out_width:0] O_data;

wire signed [out_width:0] data_del_in;
reg signed [out_width:0] data_del_1, data_del_2;

always @ (posedge I_clk)
begin
    data_del_1 <= I_reset ? 0 : data_del_in;
    data_del_2 <= I_reset ? 0 : data_del_1;
end

wire signed [out_width+coeffa_width:0] del_1st_xa1 = data_del_1 * a1;
wire signed [out_width+coeffa_width:0] del_2nd_xa2 = data_del_2 * a2;
wire signed [out_width+coeffa_width:0] in_data_ext = I_data <<< (coeffa_width-1);

wire signed [out_width+coeffa_width:0] in_data_sum = in_data_ext - del_1st_xa1 - del_2nd_xa2;
wire signed [out_width+1:0] in_data_sum_round = in_data_sum[out_width+coeffa_width:coeffa_width-1] + in_data_sum[coeffa_width-2];

assign data_del_in = in_data_sum_round[out_width:0];

wire signed [out_width+coeffb_width:0] del_in_ext = data_del_in <<< coeffb_width;
wire signed [out_width+coeffb_width:0] del_1st_xb1 = data_del_1 * b1;
wire signed [out_width+coeffb_width:0] del_2nd_ext = data_del_2 <<< coeffb_width;

wire signed [out_width+coeffb_width+1:0] out_data_sum = del_in_ext + del_1st_xb1 + del_2nd_ext;
wire signed [out_width+1:0] out_data_sum_round = out_data_sum[out_width+coeffb_width+1:coeffb_width] + out_data_sum[coeffb_width-1];

wire over_flow = !out_data_sum_round[out_width+1]&&out_data_sum_round[out_width];
wire under_flow = out_data_sum_round[out_width+1]&&!out_data_sum_round[out_width];

assign O_data = over_flow ? {1'b0,{(out_width){1'b1}}} :
				under_flow ? {1'b1,{(out_width){1'b0}}} :
				out_data_sum_round[out_width:0];

endmodule


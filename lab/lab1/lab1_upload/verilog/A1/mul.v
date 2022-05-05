//mul
//version = 2
`timescale 1 ns/ 1 ns
module mul(input signed [21:0] data1,
           input signed [29:0] data2,
           output signed [29:0] result);

wire signed[51:0] result1;
assign result1  = (data1 * data2);//>>> 15;
//assign result = (result1[51] == 1'b0) ? {1'b0,result1[28:0]} : {1'b1,result1[28:0]};
assign result   = result1[51:22];
endmodule

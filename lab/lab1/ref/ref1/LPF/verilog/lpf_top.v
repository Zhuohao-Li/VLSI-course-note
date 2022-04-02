module lpf_top (
	   // output
	   O_data,
                    
       //input
	   I_clk,
          I_reset,
	   I_data
       );

input [8:0] I_data;
input I_clk, I_reset;
output [8:0] O_data;

wire signed [12:0] iir1_out;
wire signed [15:0] iir2_out;

// 4 order 2 stages iir filter

lpf_1st ilpf_1st (
               .I_clk        (I_clk),
               .I_reset      (I_reset),
               .I_data       (I_data),
               .O_data       (iir1_out)
               );

lpf_2nd ilpf_2nd (
               .I_clk        (I_clk),
               .I_reset      (I_reset),
               .I_data       (iir1_out),
               .O_data       (iir2_out)
		   );

//////////////////////////////////////////////////////////
// g1=2^4, g2=2^3, total 2^7 gain;
// coefficient Gain = 2^-10;
// total Gain = 27*2^7*2^-10 = 3.375;
//////////////////////////////////////////////////////////

// with gain 
wire signed [19:0] data_gain = iir2_out * 27;
// round and truncation 
wire signed [9:0] data_round = data_gain[19:10] + data_gain[9];
wire overflow = !data_round[9]&&data_round[8];
wire underflow = data_round[9]&&!data_round[8];

assign O_data = overflow ? {1'b0,{8{1'b1}}} :
                underflow ? {1'b1,{8{1'b0}}} : data_round[8:0];

endmodule



module seg_filter (
    input wire clk,
    input wire rst_n,
    input wire signed [15:0] seg_in,
    output wire signed [15:0] seg_out,
    input wire signed [15:0] a1,
    input wire signed [15:0] a2,
    input wire signed [15:0] b0,
    input wire signed [15:0] b1,
    input wire signed [15:0] b2
);
    reg signed [15:0] reg_out[1:0];
    wire signed [15:0] adder_out [3:0];
    wire signed [31:0] mul_out [4:0];
    assign adder_out[0] = seg_in + adder_out[1];
    assign adder_out[1] = mul_out[0] + mul_out[1];
    assign adder_out[2] = mul_out[2] + adder_out[3];
    assign adder_out[3] = mul_out[3] + mul_out[4];
    assign mul_out[0] = (-a1 * reg_out[0])>>14;
    assign mul_out[1] = (-a2 * reg_out[1])>>14;
    assign mul_out[2] = b0 * adder_out[0];
    assign mul_out[3] = b1 * reg_out[0];
    assign mul_out[4] = b2 * reg_out[1];
    assign seg_out = adder_out[2];
    ///////////////////////////D1
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
          reg_out[0] <= 0;
        else
          reg_out[0] <= adder_out[0];
    end
    //////////////////////////D2
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
          reg_out[1] <= 0;
        else
          reg_out[1] <= reg_out[0];
    end
    
endmodule
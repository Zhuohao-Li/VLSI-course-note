module IIR(input clk,
           input rst,
           input signed [7:0] din,
           output signed [7:0] dout);
    
    register_8bits reg1(
    .clk (clk),
    .rst (rst),
    .input_data (),
    .output_data ()
    );
    
    register_8bits reg2(
    .clk (clk),
    .rst (rst),
    .input_data (),
    .output_data ()
    );
    
    register_8bits reg3(
    .clk (clk),
    .rst (rst),
    .input_data (),
    .output_data ()
    );
    
    register_8bits reg4(
    .clk (clk),
    .rst (rst),
    .input_data (),
    .output_data ()
    );
    register_8bits reg5(
    .clk (clk),
    .rst (rst),
    .input_data (),
    .output_data ()
    );
endmodule

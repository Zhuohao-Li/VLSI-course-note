module register_8bits(input clk,                     // clock signal
                      input rst,                     // reset signal
                      input wire[7:0] input_data,    // input data from input port or previous registers
                      output wire[7:0] output_data); // output data for the mul module or next registers
    
    reg [7:0] reg_file; // the storage space
    
    assign output_data = reg_file;
    // always@(*) begin    // to store the input data
    // reg_file = input_data;
    // end
    
    always@(posedge clk or negedge rst) begin
        if (!rst) begin
            reg_file <= 0; // reset the register as long as the rst signal comes
        end
        else begin
            reg_file <= input_data; // the register exports the data on the rising edge of the clock
        end
    end
    
endmodule

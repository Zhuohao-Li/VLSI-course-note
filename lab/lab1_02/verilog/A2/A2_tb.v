`timescale 1ns/1ns
module A2_plus_tb ();

reg clk;
reg rst_n;
reg signed [15:0] x_in;
wire signed [15:0] y_out;
initial begin
    clk = 1'b0;
    forever #50 clk = ~clk;
end
initial begin
            rst_n = 1'b0;
    #200    rst_n = 1'b1;
end
reg[31:0]  s_memory[0:1000];
reg[9:0] addr;

initial begin 
    $readmemb("C:/Users/SJTU-Aqueous/Desktop/A2_plus/input.txt", s_memory);
    addr <= 10'b0;
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
    x_in <= 0;
    addr <=0;
    end
    else begin
        x_in <= s_memory[addr];
    addr <= addr + 10'b1;
    end
end
integer handle;
initial
begin
 handle  =  $fopen("C:/Users/SJTU-Aqueous/Desktop/A2_plus/output.txt");
end
always@(posedge clk)
      $fdisplay(handle,"%d",y_out);
A2_top A2_top_tb(.clk(clk),.rst_n(rst_n),.x_in(x_in),.y_out(y_out));
endmodule
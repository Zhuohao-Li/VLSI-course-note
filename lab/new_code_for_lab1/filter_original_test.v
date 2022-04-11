`timescale 1 ns/ 1 ns
module filter_original_test();
    
    parameter clk_period      = 200; //����ʱ���ź����ڣ�Ƶ�ʣ�:1.6MHz
    parameter clk_half_period = clk_period/2;
    parameter data_num        = 2000;  //�������ݳ���
    
    reg clk;
    reg rst;
    reg [7:0] data_in;
    wire [18:0] data_out;
    reg[7:0] in[data_num:0];
    integer i, fp_w;
    reg[18:0] out[data_num:0];
    
    filter_original u(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out));
    
    initial
    begin
        $readmemb("./input.txt", in);
        fp_w       = $fopen("./data_out.txt","w");
        i          = 0;
        clk        = 0;
        rst        = 1;
        #10000 rst = 0;
    end
    
    always
    #clk_half_period clk = ~clk;
    
    always @(posedge clk)
    begin
        data_in <= in[i];
        out[i]  <= data_out;
        $fwrite(fp_w, "%b\n", data_out);//write
        i     = i+1;
        if (i == data_num+1) $fclose(fp_w);
    end
endmodule

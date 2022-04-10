`timescale 1 ns/ 1 ns
module IIR_filter_tst();
    
    parameter clk_period      = 200; //����ʱ���ź����ڣ�Ƶ�ʣ�:1.6MHz
    parameter clk_half_period = clk_period/2;
    parameter Data_num        = 2000;  //�������ݳ���
    
    reg clk;
    reg rst;
    reg [7:0] Data_in;
    wire [17:0] Data_out;
    reg[7:0] in[Data_num:0];
    integer i, fp_w;
    reg[17:0] out[Data_num:0];
    
    IIR_Filter_8 A1 (
    .Data_out(Data_out),
    .Data_in(Data_in),
    .clk(clk),
    .rst(rst)
    );
    
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
        Data_in <= in[i];
        out[i]  <= Data_out;
        $fwrite(fp_w, "%b\n", Data_out);//write
        i     = i+1;
        if (i == Data_num+1) $fclose(fp_w);
    end
endmodule

# define clock and period

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
#set_output_delay -clock clk 0.500 [get_ports {data_out[*]}]
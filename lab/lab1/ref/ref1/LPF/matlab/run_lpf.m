close all
clear all

Fs = 32*1000;

F_fund = 2000; %Hz
F_harmonic_3 = 6000; %Hz

Len = 3200;

V_In_fund = cos(2*pi*F_fund/Fs*(1:Len));
V_In_harmonic_3 = cos(2*pi*F_harmonic_3/Fs*(1:Len)+pi/3);

plot_len = 100;

figure();
subplot(2,1,1)
plot(V_In_fund(1:plot_len));
subplot(2,1,2)
plot(V_In_harmonic_3(1:plot_len));

V_In_bus = 0.5*V_In_fund + 0.5*V_In_harmonic_3;

figure();
plot(V_In_bus(1:plot_len));

res_lpf = 8;
v_in_data = bround(V_In_bus, res_lpf);
data_out = v_in_data*2^res_lpf;
for i=1:length(data_out)
  if (data_out(i) < 0)
    data_out(i) = data_out(i) + pow2(res_lpf+1);
  end
end

fid = fopen( 'lpf_mat_in.hex','w');
 for k = 1:length(data_out);
   fprintf( fid, '%3x\n',data_out(k));
 end
fclose(fid);

[v_out] = lpf(V_In_bus);

figure();
plot(v_out(end-plot_len:end));

data_out = v_out*2^res_lpf;
for i=1:length(data_out)
  if (data_out(i) < 0)
    data_out(i) = data_out(i) + pow2(res_lpf+1);
  end
end

fid = fopen( 'lpf_mat_out.hex','w');
 for k = 1:length(data_out);
   fprintf( fid, '%3x\n',data_out(k));
 end
fclose(fid);





function out_bus = lpf(in_bus);

res_coeff_lpf = 10;

load lpf_1_coeff.dec;
lpf_b1=lpf_1_coeff(1:3);
lpf_a1=lpf_1_coeff(4:6);

load lpf_2_coeff.dec;
lpf_b2=lpf_2_coeff(1:3);
lpf_a2=lpf_2_coeff(4:6);

load lpf_gain.dec;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% begin the first stage
backward_1 = [];
data_del_1st = 0;
data_del_2nd = 0;
res_lpf_1_1 = 8;
res_lpf_1_2 = 12;

for k = 1:length(in_bus);
  data_adder = in_bus(k)*lpf_a1(1) - data_del_1st*lpf_a1(2) - data_del_2nd*lpf_a1(3);
  data_adder = data_adder/2^(res_coeff_lpf);
  data_del_in = bround(data_adder, res_lpf_1_1);
 %data_del_in = btrunc(data_adder, res_lpf_1_1);
  backward_1(k) = data_del_in;
  data_del_2nd = data_del_1st;
  data_del_1st = data_del_in;
end % end of for

lpf_1_out = 2^(-4)*filter(lpf_b1, 2^res_coeff_lpf, backward_1);
 out_bus_1 = bround(lpf_1_out, res_lpf_1_2);
%out_bus_1 = btrunc(lpf_1_out, res_lpf_1_2);

% end of the first stage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% begin the second stage

in_bus = out_bus_1;
backward_2 = [];
data_del_1st = 0;
data_del_2nd = 0;
res_lpf_2_1 = 12;
res_lpf_2_2 = 15;

for k = 1:length(in_bus);
  data_adder = in_bus(k)*lpf_a2(1) - data_del_1st*lpf_a2(2) - data_del_2nd*lpf_a2(3);
  data_adder = data_adder/2^(res_coeff_lpf);
  data_del_in = bround(data_adder, res_lpf_2_1);
 %data_del_in = btrunc(data_adder, res_lpf_2_1);
  backward_2(k) = data_del_in;
  data_del_2nd = data_del_1st;
  data_del_1st = data_del_in;
end % end of for

lpf_2_out = 2^(-3)*filter(lpf_b2, 2^res_coeff_lpf, backward_2);
 out_bus_2 = bround(lpf_2_out, res_lpf_2_2);
%out_bus_2 = btrunc(lpf_2_out, res_lpf_2_2);

% end of the second stage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

res_lpf = 8;

out_bus_lpf = out_bus_2; 
out_bus = out_bus_lpf*(2^7)*lpf_gain/(2^res_coeff_lpf);
 out_bus = bround(out_bus, res_lpf);
%out_bus = btrunc(out_bus, res_lpf);

% end of function


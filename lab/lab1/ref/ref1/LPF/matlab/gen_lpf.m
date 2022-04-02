close all;
clear all;

% Elliptic Lowpass filter designed using the ELLIP function.

% All frequency values are in Hz.
Fs = 32000;  % Sampling Frequency

N     = 4;     % Order
Fpass = 4000;  % Passband Frequency
Apass = 1;     % Passband Ripple (dB)
Astop = 40;    % Stopband Attenuation (dB)

% Calculate the zpk values using the ELLIP function.
[z,p,k] = ellip(N, Apass, Astop, Fpass/(Fs/2));

% To avoid round-off errors, do not use the transfer function.  Instead
% get the zpk representation and convert it to second-order sections.
[sos_var,g] = zp2sos(z, p, k);

res_coeff_lpf = 10;

b1=floor(sos_var(1,1:3)*2^res_coeff_lpf + 0.5);
a1=floor(sos_var(1,4:6)*2^res_coeff_lpf + 0.5);

fid = fopen( 'lpf_1_coeff.dec','w');
 for k = 1:length(b1);
   fprintf( fid, '%6d\n',b1(k));
 end
 for k = 1:length(a1);
   fprintf( fid, '%6d\n',a1(k));
 end
fclose(fid);

b2=floor(sos_var(2,1:3)*2^res_coeff_lpf + 0.5);
a2=floor(sos_var(2,4:6)*2^res_coeff_lpf + 0.5);

fid = fopen( 'lpf_2_coeff.dec','w');
 for k = 1:length(b2);
   fprintf( fid, '%6d\n',b2(k));
 end
 for k = 1:length(a2);
   fprintf( fid, '%6d\n',a2(k));
 end
fclose(fid);

gain_lpf = floor(g*2^res_coeff_lpf + 0.5);

fid = fopen( 'lpf_gain.dec','w');
  fprintf( fid, '%6d\n',gain_lpf);
fclose(fid);

lpf1_mr = freqz(b1, a1, 'whole', Fs);
figure();
plot(abs(lpf1_mr));
%plot(20*log10(abs(lpf1_mr)+eps));

lpf2_mr = freqz(b2, a2, 'whole', Fs);
figure();
plot(abs(lpf2_mr));
%plot(20*log10(abs(lpf2_mr)+eps));

total_lpf_mr = lpf1_mr.*lpf2_mr*gain_lpf/2^res_coeff_lpf;
figure();
plot(abs(total_lpf_mr));
figure();
plot(20*log10(abs(total_lpf_mr)+eps));

% [EOF]

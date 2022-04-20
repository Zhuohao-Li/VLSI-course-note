% Generating signals
Fs = 1e4;
% Fs=10kHz
f1 = 100;
% f1=100Hz
f2 = 1500;
% f2=1500Hz
f3 = 3000;
% f3=3000Hz
t = 0 : 1/Fs : 1;
s1 = cos((2 * pi * f1) .* t);
% Generating cosine signal with f1=100 Hz
s2 = cos((2 * pi * f2) .* t);
% Generating cosine signal with f2=1500 Hz
s3 = cos((2 * pi * f3) .* t);
% Generating cosine signal with f3=3000 Hz
s = (s1 + s2 + s3) ./ 3;
% add them

figure(1);
% plot
subplot(2,1,1); stem(s(1:300)); grid;
% plot original
title('Original signal in time domain');
xlabel('k');
xlabel('s(k)');
% FFT on signal s
len = 4096; % FFT length
f = Fs .* (0 : len /2 - 1) ./ len ;
y = fft (s, len ); % do len points FFT transform on the signal s

subplot(2,1,2);
plot(f, abs(y(1:len/2))); grid;
% plot original signal s on the frequency domain
title('Original signal spectrum in frequency domain')
xlabel('f(Hz)');
ylabel('S(f)');


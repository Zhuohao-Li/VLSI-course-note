% Generating signals
Fs = 10e6;
% Fs=10MHz
f1 = 0.5e6;

f2 = 1.5e6;

f3 = 2e6;

f4 = 3.2e6;

f5 = 4e6;

t = 0 : 1/Fs : 1;
s1 = cos((2 * pi * f1) .* t);

s2 = cos((2 * pi * f2) .* t);

s3 = cos((2 * pi * f3) .* t);

s4 = cos((2 * pi * f4) .* t);

s5 = cos((2 * pi * f5) .* t);
s = (s1 + s2 + s3 + s4 + s5) ./ 5;
% add them
figure(1);
subplot(2,1,1); stem(s(1:300)); grid;
title('Original signal in time domain');
xlabel('k');
xlabel('s(k)');

len=4096;
f = Fs .* (0 :len/2-1) ./ len ;
y=fft(s,len);

subplot(2,1,2);
plot(f, abs(y(1:len/2))); grid;
% plot original signal s on the frequency domain
title('Original signal spectrum in frequency domain')
xlabel('f(Hz)');
ylabel('S(f)');

%[SOS, G] = tf2sos(b, a)
load('.\a.mat');
load('.\b.mat');

s_bp=filter(b,a,s); % do IIR filtering to get bandpass signal s_bp
y_bp=fft(s_bp,len); % do len points FFT transform on the signal s_bp
figure(2);
plot(f, abs(y_bp(1:len/2))); grid;



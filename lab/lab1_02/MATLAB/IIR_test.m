/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-12 14:14:50
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 13:58:22
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/matlab/IIR_test.m
 * @Description: edith_lzh@sjtu.edu.cn
 * This file test output.txt to check if it is correct.
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved. 
 */

% Generating signals
Fs = 10e6; % Fs=10MHz
f1 = 0.3e6;

f2 = 1.5e6;

f3 = 3.2e6;

f4 = 4.9e6;

t = 0 : 1/Fs : 1;
s1 = cos((2 * pi * f1) .* t);

s2 = cos((2 * pi * f2) .* t);

s3 = cos((2 * pi * f3) .* t);

s4 = cos((2 * pi * f4) .* t);

s = (s1 + s2 + s3 + s4 ) ./ 4;
% add them and get mean
figure(1);
subplot(2,1,1); stem(s(1:300)); grid;
title('Original signal in time domain');
xlabel('k');
xlabel('s(k)');


len=2000;
f = Fs .* (0 :len/2-1) ./ len ;
y=fft(s,len);

subplot(2,1,2);
plot(f, abs(y(1:len/2))); grid;
% plot original signal s on the frequency domain
title('Original signal spectrum in frequency domain')
xlabel('f(Hz)');
ylabel('S(f)');


%load('./a.mat');
%load('./b.mat');


%fid=fopen('/Users/edith_lzh/Documents/MATLAB/input.txt'); % load output from verilog
%output=zeros(2000,1);
%m=1;
%%%%%%% 2's complement 2 signed decimal
%while(m< 2001)
%    qq=fgetl(fid);
%    if (qq(1)=='1')
%        output(m,1)=bin2dec(qq)-2^8;
%    else output(m,1)=bin2dec(qq);
%    end
%    output(m,1)=fgetl(fid);
%    m=m+1;
%end
%a=load('/Users/edith_lzh/Documents/MATLAB/a.mat');
%b=load('/Users/edith_lzh/Documents/MATLAB/b.mat');
output = load('/Users/edith_lzh/Documents/MATLAB/output.txt');
%s_bp=filter(b,a,s);
%y_bp=fft(s_bp,len); 
y_bp=fft(output,len); % do len points FFT transform on the signal s_bp
figure(2);
subplot(2,1,1);

output1=output';
stem(output(1:2001)); grid;
%stem(s_bp(1:200)); grid;
%plot(t(100:200),s2(100:200),'blue',t(100:200),output(100:200),'red');grid;xlim([0.01 0.02]) 
%legend('Original  signal'); 
title('Comparison of signal before and after filtering'); 
xlabel('t(s)');
ylabel('s(t)'); 
subplot(2,1,2);
plot(f,abs(y_bp(1:len/2)));grid;
title('Filtered signal spectrum in frequency domain'); 
xlabel('f (Hz)');
ylabel('S(f)');



close;
clc;
clear;
N=2000;
f0=0.5e6;
f1=1.5e6;
f2=3.2e6;
f3=4e6;
fs=10e6;
n=1:N;
y=sin(2*pi*f0.*n/fs)+sin(2*pi*f1.*n/fs)+sin(2*pi*f2.*n/fs)+sin(2*pi*f3.*n/fs);
y=y.';
y1=fi(y,1,8,5);
str_array = y1.bin;
fid1=fopen('C:\Me\y1.txt','wb+');
for i=1:N
    fprintf(fid1, '%s\n', str_array(i, :));
end
fclose(fid1);



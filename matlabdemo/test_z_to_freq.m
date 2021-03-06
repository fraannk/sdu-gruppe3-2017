clear all, close all, clc
% M = csvread('ab2.dat');
% b(:) = M(1,:);
% a(:) = M(2,:);
fs = 44.1*10^3;
f = [2000, 2000, 2000, 2000, 4000, 4000, 4000, 4000 ];
Q = [1, 5, 10, 50, 1, 5, 10 ,50];
W = [1000, 500, 100, 10, 1000, 500, 100, 10];
A_v = [5, 5, 5, 5, -5, -5, -5, -5];
filter_type = 'PEAK';

[b(1,:),a(1,:) ] = filter_typer(filter_type,W(1),f(1),fs,A_v(1));
[b(2,:),a(2,:) ] = filter_typer(filter_type,W(2),f(2),fs,A_v(2));
[b(3,:),a(3,:) ] = filter_typer(filter_type,W(3),f(3),fs,A_v(3));
[b(4,:),a(4,:) ] = filter_typer(filter_type,W(4),f(4),fs,A_v(4));
[b(5,:),a(5,:) ] = filter_typer(filter_type,W(5),f(5),fs,A_v(5));
[b(6,:),a(6,:) ] = filter_typer(filter_type,W(6),f(6),fs,A_v(6));
[b(7,:),a(7,:) ] = filter_typer(filter_type,W(7),f(7),fs,A_v(7));
[b(8,:),a(8,:) ] = filter_typer(filter_type,W(8),f(8),fs,A_v(8));
 step_size =2;% Hz             round((fs/2)/(10*16));
 f= 1:step_size:10^4;
 
 for j=1:1:8
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
 
 
figure(1)
H_res = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:).*amp(5,:).*amp(6,:).*amp(7,:).*amp(8,:);
subplot(211)

out = [transpose(f), transpose(20*log10(amp(1,:)))];
csvwrite('p_h1.dat',out);
out = [transpose(f), transpose(20*log10(amp(2,:)))];
csvwrite('p_h2.dat',out);
out = [transpose(f), transpose(20*log10(amp(3,:)))];
csvwrite('p_h3.dat',out);
out = [transpose(f), transpose(20*log10(amp(4,:)))];
csvwrite('p_h4.dat',out);
out = [transpose(f), transpose(20*log10(amp(5,:)))];
csvwrite('p_h5.dat',out);
out = [transpose(f), transpose(20*log10(amp(6,:)))];
csvwrite('p_h6.dat',out);
out = [transpose(f), transpose(20*log10(amp(7,:)))];
csvwrite('p_h7.dat',out);
out = [transpose(f), transpose(20*log10(amp(8,:)))];
csvwrite('p_h8.dat',out);

semilogx(f,20*log10(amp))
title('Individuelle Bånd')
ylabel('[dB]')
xlabel('Hz')
xlim([20 fs/2])
subplot(212)
semilogx(f(1,:),20*log10(H_res))
title('Resulterende H(z)')
ylabel('[dB]')
xlabel('Hz')
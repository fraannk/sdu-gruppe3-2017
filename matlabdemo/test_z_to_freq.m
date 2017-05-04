clear all, close all, clc
% M = csvread('ab2.dat');
% b(:) = M(1,:);
% a(:) = M(2,:);
fs = 44.1*10^3;
f = [2000, 4000, 6000, 8000, 3000, 5000, 7000, 9000 ];
Q = [1, 5, 10, 50, 1, 5, 10 ,50];
A_v = [5, -5, 5, -5, -5, -5, -5, -5];
filter_type = 'PEAK';

[b(1,:),a(1,:) ] = model_filter(filter_type,Q(1),f(1),fs,A_v(1));
[b(2,:),a(2,:) ] = model_filter(filter_type,Q(2),f(2),fs,A_v(2));
[b(3,:),a(3,:) ] = model_filter(filter_type,Q(3),f(3),fs,A_v(3));
[b(4,:),a(4,:) ] = model_filter(filter_type,Q(4),f(4),fs,A_v(4));
 step_size = 100;% Hz             round((fs/2)/(10*16));
 f= 1:step_size:fs/2;
 
 for j=1:1:4
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
 
 
figure(1)
H_res = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:);
subplot(211)
plot(f,20*log10(amp))
title('Individuelle Bånd')
ylabel('[dB]')
xlabel('Hz')
subplot(212)
plot(f(1,:),20*log10(H_res))
title('Resulterende H(z)')
ylabel('[dB]')
xlabel('Hz')
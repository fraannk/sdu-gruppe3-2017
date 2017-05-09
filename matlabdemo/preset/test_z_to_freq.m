clear all, close all, clc
% M = csvread('ab2.dat');
% b(:) = M(1,:);
% a(:) = M(2,:);
fs = 44.1*10^3;
f = [400, 17000, 3000, 9000, 0, 0, 0, 0 ];
Q = [0, 0, 1000, 1000, 0, 0, 0 ,0];
A_v = [-40, -40, 20, 20, 0, 0, 0, 0];
filter_type = 'PEAK';

[b(1,:),a(1,:) ] = filter_typer('LSHELV',Q(1),f(1),fs,A_v(1));
[b(2,:),a(2,:) ] = filter_typer('HSHELV',Q(2),f(2),fs,A_v(2));
[b(3,:),a(3,:) ] = filter_typer(filter_type,Q(3),f(3),fs,A_v(3));
[b(4,:),a(4,:) ] = filter_typer(filter_type,Q(4),f(4),fs,A_v(4));

size_ = 1; 
% 
% log_steps =  (log10(20*10^3)-log10(20))/(2*size_);
% f_0 = log10(20);
% j = 1;
% for i=1:1:2*size_
%     if (mod(i,2) == 0)
%         f_0 = log10(20)+i*log_steps;
%         f2(j) = 10^(f_0);
%         j = j + 1;
%     end
% end
% for i=1:1:4
%     i
%     amp(i) = z_to_freq(a(i,:),b(i,:),3000,fs)
% end
f2 = 0:1:fs/2;

 for j=1:1:4
    for i=1:1:length(f2)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f2(i),fs);
    end
 end
%  freq = 3000;
%  result = amp(1,freq)*amp(2,freq)*amp(3,freq)*amp(4,freq);
% 
% 

figure(1)
H_res = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:);
% subplot(211)

plot(f2,20*log10(amp))
title('Individuelle Bånd')
ylabel('[dB]')
xlabel('Hz')
xlim([0 fs/2])
figure(2)
% subplot(212)
plot(f2(1,:),20*log10(H_res))
title('Resulterende H(z)')
ylabel('[dB]')
xlabel('Hz')
xlim([0 fs/2])

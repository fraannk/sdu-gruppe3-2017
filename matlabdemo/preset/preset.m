

%% Klassisk preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 4;
F =     [40         6*10^3  14*10^3  16*10^3     ];
G =     [-9        -7      -7        -9          ];
W =     [1          200     400      500         ];
type =  'PEAK';
Master_dB = 5;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer('LSHELV', W(1), F(1),fs,G(1)); 
[b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
[b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3)); 
[b(4,:), a(4,:)] = filter_typer('HSHELV', W(4), F(4),fs,G(4)); 

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end

H = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:).*Master;
h1 = figure(1);
plot(f,20*log10(H),'Linewidth',2)
grid on
title('Klassisk EQ')
xlim( [20 20*10^3])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
% print( h1, '-dpng', '-r200', 'eq_klassik.png')


%% Rock preset
clear all, clc, close all
fs = 44.1*10^3;
N = 2^16;
band = 7;
F =     [20, 60, 170, 310,  600, 6000, 3000,19000 ];
G =     [-5, 5,  4,   -5,   -6,  -7, -4, 5] ;
W =     [1 , 10, 100, 30, 10, 7000, 1000, 600 ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer('LSHELV', W(1), F(1),fs,G(1)); 
[b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
[b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3));
[b(4,:), a(4,:)] = filter_typer(type, W(4), F(4),fs,G(4)); 
[b(5,:), a(5,:)] = filter_typer(type, W(5), F(5),fs,G(5)); 
[b(6,:), a(6,:)] = filter_typer(type, W(6), F(6),fs,G(6)); 
[b(7,:), a(7,:)] = filter_typer(type, W(7), F(7),fs,G(7)); 
[b(8,:), a(8,:)] = filter_typer('HSHELV', W(8), F(8),fs,G(8));


 %for j=1:1:band
[amp1,f1 ] = freqz(a(1,:),b(1,:),N,fs);
[amp2,f2 ] = freqz(a(2,:),b(2,:),N,fs);
[amp3,f3 ] = freqz(a(3,:),b(3,:),N,fs);
[amp4,f4 ] = freqz(a(4,:),b(4,:),N,fs);
[amp5,f5 ] = freqz(a(5,:),b(5,:),N,fs);
[amp6,f6 ] = freqz(a(6,:),b(6,:),N,fs);
[amp7,f7 ] = freqz(a(7,:),b(7,:),N,fs);
[amp8,f8 ] = freqz(a(8,:),b(8,:),N,fs);
 %end

H = amp1.*amp2.*amp3.*amp4.*amp5.*amp6.*amp7.*amp8.*Master;
figure(2)
plot(f1,20*log10(abs(H)))
title('Rock EQ')
xlim( [0 18000])
ylim([-12 12])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')

%% Megaphon preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 1;
F =     [600          ];
G =     [15               ];
W =     [200            ];
type =  'PEAK';
Master_dB = -10;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer('PEAK', W(1), F(1),fs,G(1)); 
% [b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
% [b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3)); 
% [b(4,:), a(4,:)] = filter_typer('HSHELV', W(4), F(4),fs,G(4)); 

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end

H = amp(1,:).*Master;
h1 = figure(1);
plot(f,20*log10(H),'Linewidth',2)
grid on
title('Megaphon EQ')
xlim( [20 20*10^3])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')

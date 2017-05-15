clear all, close all, clc


[f2,amp2,phase2] = plotcsvbode('1kNotch_test.csv','1k Notch Profil',1);
[f1,amp1,phase1] = plotcsvbode('BassBoost_test.csv','Bass Boost Profil',2);
[foff,ampoff,phaseoff] = plotcsvbode('EQ_off_test.csv','EQ off Profil',3);
plotcsvbode('Megafon_test.csv','Megafon Profil',4);
plotcsvbode('HighBoost_test.csv','High Boost Profil',5);
plotcsvbode('BassHighBoost_test.csv','High/Bass boost Profil',6);
plotcsvbode('Rock_test.csv','Rock Profil',7);
    
h1 =figure(8);

fs = 44.1*10^3;
N = 2^32;
band = 1;
F =     [1000  ];
G =     [-40    ];
W =     [100   ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

offset = 10^(0/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer(type, W(1), F(1),fs,G(1)); 
% [b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
% [b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3)); 
% [b(4,:), a(4,:)] = filter_typer('HSHELV', W(4), F(4),fs,G(4)); 

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
H=Master;
 for j=1:1:band
     H = H.*amp(j,:);
 end
 
 semilogx(f2,offset.*(amp2 - ampoff),f,20*log10(H))
 grid on
 title('1k Notch profil')
 legend('Bodemålinger','Teoretisk')
 xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
 xlim([20 20000])
 ylim([-10 5])
 print( h1, '-dpng', '-r200', 'eq_1knotch.png')
 
 %% rock 
 
 clear all, close all, clc
 
 
fs = 44.1*10^3;
N = 2^16;
band = 7;
F =     [20, 60, 170, 310,  600, 6000, 3000];
G =     [-5, 5,  4,   -5,   -6,  -7, -4, ] ;
W =     [10 , 10, 100, 30, 10, 7000, 1000];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer(type, W(1), F(1),fs,G(1)); 
[b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
[b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3));
[b(4,:), a(4,:)] = filter_typer(type, W(4), F(4),fs,G(4)); 
[b(5,:), a(5,:)] = filter_typer(type, W(5), F(5),fs,G(5)); 
[b(6,:), a(6,:)] = filter_typer(type, W(6), F(6),fs,G(6)); 
[b(7,:), a(7,:)] = filter_typer(type, W(7), F(7),fs,G(7)); 
%[b(8,:), a(8,:)] = filter_typer('HSHELV', W(8), F(8),fs,G(8));

[f1, amp1,phase1]= plotcsvbode('Rock_test.csv','Rock Profil',1);
 %for j=1:1:band
 [foff,ampoff,phaseoff] = plotcsvbode('EQ_off_test.csv','EQ off Profil',2);
f = 0:1:fs/2;
offset = 10^(-4/20);

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
 %end

H = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:).*amp(5,:).*amp(6,:).*amp(7,:).*Master;
H =  H.*offset;
h1 = figure(3);
 semilogx(f1,(amp1- ampoff ),f,20*log10(H))
 grid on
 title('Rock profil')
 xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
 xlim([20 20000])
 legend('Bode målinger','Teoretisk')
 print( h1, '-dpng', '-r200', 'eq_rock.png')
%  ylim([-50 7])

h2 = figure(4);

semilogx(foff,ampoff)
title('Equalizer off')
xlim([20 20000])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
  grid on
print( h2, '-dpng', '-r200', 'eq_off.png')


%% megafon
clear all, close all, clc
fs = 44.1*10^3;
band =1;
type =  'PEAK';
Master_dB = -10;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer(type, 200, 600,fs,25);
f = 0:1:fs/2;
    for i=1:1:length(f)
        amp(1,i) = z_to_freq(a(1,:),b(1,:),f(i),fs);
    end

    H = amp(1,:).*Master;
[f_meg,amp_meg,phase_meg] = plotcsvbode('Megafon_test.csv','Megafon Profil',1);
[foff,ampoff,phaseoff] = plotcsvbode('EQ_off_test.csv','EQ off Profil',1);
 h3=  figure(2) ;
semilogx(f_meg,(amp_meg-ampoff),f,20*log10(H))
title('Megafon preset')
xlim([20 20000])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('Bode målinger','Teoretisk')
  grid on
print( h3, '-dpng', '-r200', 'eq_megafon.png')
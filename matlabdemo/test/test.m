clear all, close all, clc


[f2,amp2,phase2] = plotcsvbode('./Andet/1kNotch_test.csv','1k Notch Profil',1);
[f1,amp1,phase1] = plotcsvbode('./Andet/BassBoost_test.csv','Bass Boost Profil',2);
[foff,ampoff,phaseoff] = plotcsvbode('./Andet/EQ_off_test.csv','EQ off Profil',3);
plotcsvbode('./Andet/Megafon_test.csv','Megafon Profil',4);
plotcsvbode('./Andet/HighBoost_test.csv','High Boost Profil',5);
plotcsvbode('./Andet/BassHighBoost_test.csv','High/Bass boost Profil',6);
plotcsvbode('./Andet/Rock_test.csv','Rock Profil',7);
    
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
band = 8;
F =     [20, 60, 170, 310,  600, 6000, 3000, 19000];
G =     [-5, 5,  4,   -5,   -6,  -7, -4, -5] ;
W =     [10 , 10, 100, 30, 10, 7000, 1000,600];
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
[b(8,:), a(8,:)] = filter_typer('HSHELV', W(8), F(8),fs,G(8));

[f1, amp1,phase1]= plotcsvbode('./Andet/nyrock.csv','Rock Profil',1);
 %for j=1:1:band
[foff,ampoff,phaseoff] = plotcsvbode('./Andet/low_res.csv','EQ off Profil',2);
f = 0:1:fs/2;
% offset = 10^(0/20);

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
 %end

H = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:).*amp(5,:).*amp(6,:).*amp(7,:).*amp(8,:).*Master;
h1 = figure(3);
 semilogx(f1,(amp1- ampoff),f,20*log10(H))
 grid on
 title('Rock profil')
 xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
 xlim([20 20000])
 legend('Bode målinger','Teoretisk')
 print( h1, '-dpng', '-r200', 'eq_rock.png')
ylim([-20 20])
% 
% h2 = figure(4);
% 
% semilogx(foff,ampoff)
% title('Equalizer off')
% xlim([20 20000])
% ylim([-16 16])
% xlabel('f [Hz]')
% ylabel('|H(f)| [dB]')
%   grid on
% print( h2, '-dpng', '-r200', 'eq_off.png')

t = 0:(1/fs):0.5;
x = sin(2*pi*310*t);

 y= casked_filter(x,a,b,band); 

figure(4)

subplot(211)

plot(t,x)
ylim([-1.2 1.2])
subplot(212)
plot(t,y)
ylim([-1.2 1.2])





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
[f_meg,amp_meg,phase_meg] = plotcsvbode('./Andet/Megafon_test.csv','Megafon Profil',1);
[foff,ampoff,phaseoff] = plotcsvbode('./Andet/EQ_off_test.csv','EQ off Profil',1);
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

%% amplitude test
clear all,close all, clc

% 
% [f1,amp,phase] = plotcsvbode('p9_test.csv','5dB',1);
% plotcsvbode('p10_test.csv','-5dB',2);
% plotcsvbode('p11_test.csv','10dB',3);
% plotcsvbode('p12_test.csv','-10dB',4);

figure(1)
fs = 44100;
f = 0:1:fs/2;
[b1,a1] = filter_typer('PEAK', 500 ,3000,fs,5);
[b2,a2] = filter_typer('PEAK', fs/2 - 1,fs/2,fs,5);
    for i=1:1:length(f)
        amp1(i) = z_to_freq(a1(:),b1(:),f(i),fs);
        amp2(i) = z_to_freq(a2(:),b2(:),f(i),fs);
    end
plot(f,20*log10(amp1))
ylim([-10 10])



%% bandwidth
clear all, close all, clc

[f1, amp1,phase1]=plotcsvbode('./bandwidth/100bw.csv','rock',1);
[f2, amp2,phase2]=plotcsvbode('./bandwidth/500bw.csv','rock',1);
[f3, amp3,phase3]=plotcsvbode('./bandwidth/1000bw.csv','rock',1);
[f4, amp4,phase4]=plotcsvbode('./bandwidth/minus100bw.csv','rock',1);
[f5, amp5,phase5]=plotcsvbode('./bandwidth/minus500bw.csv','rock',1);
[f6, amp6,phase6]=plotcsvbode('./bandwidth/minus1000bw.csv','rock',1);
[foff, ampoff,phaseoff]= plotcsvbode('./bandwidth/Eq_off_bw.csv','rock',1);
h3 = figure(5);
semilogx(f1,amp1 -ampoff)
hold on
semilogx(f2,amp2 -ampoff)
semilogx(f3,amp3 -ampoff)
semilogx(f4,amp4 -ampoff)
semilogx(f5,amp5 -ampoff)
semilogx(f6,amp6 -ampoff)
title('Test af båndbredde')
xlim([20 20000])
ylim([-6 6])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('\Delta\omega = 100','\Delta\omega = 500','\Delta\omega = 1000','\Delta\omega = 100','\Delta\omega = 500','\Delta\omega = 1000')
  grid on
print( h3, '-dpng', '-r200', 'test_bw.png')
hold off
%% Test
clear all, close all, clc
% peak/notch
[foff, ampoff,phaseoff]= plotcsvbode('./Frekvens/Eq_off_freq.csv','rock',1);

[f1, amp1,phase1]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/100bw.csv','Frekvensplacering',1);
[f2, amp2,phase2]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/500bw.csv','Frekvensplacering',1);
[f3, amp3,phase3]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/1000bw.csv','Frekvensplacering',1);
[f4, amp4,phase4]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/bw_100hz_minus5dB.csv','Frekvensplacering',1);
[f5, amp5,phase5]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/bw_500hz_minus5dB.csv','Frekvensplacering',1);
[f6, amp6,phase6]=plotcsvbode('./Maalinger/Med_hotfix/Bandwidth/bw_1000hz_minus5dB.csv','Frekvensplacering',1);


h3 = figure(1);
semilogx(f1,amp1 - ampoff)
hold on
semilogx(f2,amp2 - ampoff)
semilogx(f3,amp3 - ampoff)
semilogx(f4,amp4 - ampoff)
semilogx(f5,amp5 - ampoff)
semilogx(f6,amp6 - ampoff)
xlim([20 20000])
ylim([-6 6])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('BW = 100hz','BW = 500hz','BW = 1000hz','BW = 100hz','BW = 500hz','BW = 1000hz')
  grid on
print( h3, '-dpng', '-r200', 'Bandwidth_Med_hotfix.png')
hold off


%% Frekvensplacering
clear all, close all, clc

% peak/notch
subplot(411)
[f1, amp1,phase1]=plotcsvbode('./Maalinger/Uden_hotfix/Bandwidth/bw_100_gain_5dB.csv','Frekvensplacering',10);
subplot(412)
[f2, amp2,phase2]=plotcsvbode('./Maalinger/Uden_hotfix/Bandwidth/bw_100_gain_minus5dB.csv','Frekvensplacering',10);
subplot(413)
[f3, amp3,phase3]=plotcsvbode('./Maalinger/Uden_hotfix/Bandwidth/bw_500_gain_5dB.csv','Frekvensplacering',10);
subplot(414)
[f4, amp4,phase4]=plotcsvbode('./Maalinger/Uden_hotfix/Bandwidth/bw_500_gain_minus5dB.csv','Frekvensplacering',10);
% high shelv
[f5, amp5,phase5]=plotcsvbode('./Frekvens/hs1000hz_5dB.csv','rock',1);
[f6, amp6,phase6]=plotcsvbode('./Frekvens/hs5000hz_5db.csv','rock',1);
[f7, amp7,phase7]=plotcsvbode('./Frekvens/hs1000hz_minus5dB.csv','rock',1);

% low shelv
[f8, amp8,phase8]=plotcsvbode('./Frekvens/ls5000hz_5db.csv','rock',1);
[f9, amp9,phase9]=plotcsvbode('./Frekvens/ls1000hz_5db.csv','rock',1);
[f10, amp10,phase10]=plotcsvbode('./Frekvens/ls5000hz_minus5db.csv','rock',1);
[f11, amp11,phase11]=plotcsvbode('./Frekvens/ls1000hz_minus5db.csv','rock',1);


% eq off
[foff, ampoff,phaseoff]= plotcsvbode('./Frekvens/Eq_off_freq.csv','rock',1);

% figures

h3 = figure(5);
title('Peak/Notch målinger')
semilogx(f1,amp1 -ampoff)
hold on
semilogx(f2,amp2 -ampoff)
semilogx(f3,amp3 -ampoff)
semilogx(f4,amp4 -ampoff)
xlim([20 20000])
ylim([-6 6])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('f_0 = 100Hz','f_0 = 5kHz','f_0 = 100Hz','f_0 = 5kHz')
  grid on
print( h3, '-dpng', '-r200', 'test_freq_peak.png')
hold off


h4 = figure(6);
semilogx(f5,amp6 - ampoff)
hold on
semilogx(f6,amp6 - ampoff)
semilogx(f7,amp7 - ampoff)
title('High Shelv målinger')
xlim([20 20000])
ylim([-6 6])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('f_0 = 5kHz','f_0 = 5kHz')
  grid on
print( h4, '-dpng', '-r200', 'test_freq_hs.png')
hold off


h5 = figure(7);
semilogx(f8,amp8 - ampoff)
hold on
semilogx(f10,amp10 - ampoff)
title('Low Shelv målinger')
xlim([20 20000])
ylim([-6 6])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('f_0 = 5kHz','f_0 = 5kHz')
  grid on
print( h5, '-dpng', '-r200', 'test_freq_ls.png')
hold off

%% Amplitude test
clear all,close all, clc
[f1, amp1,phase1]=plotcsvbode('./Amplitude/5dB.csv','rock',1);
[f2, amp2,phase2]=plotcsvbode('./Amplitude/7dB.csv','rock',1);
[f3, amp3,phase3]=plotcsvbode('./Amplitude/minus5dB.csv','rock',1);
[f4, amp4,phase4]=plotcsvbode('./Amplitude/minus7dB.csv','rock',1);
[foff, ampoff,phaseoff]=plotcsvbode('./Amplitude/Eq_off_kode.csv','rock',5);
h1 = figure(2);
semilogx(f1,amp1 - ampoff)
hold on
semilogx(f2,amp2 - ampoff)
semilogx(f3,amp3 - ampoff,'b')
% semilogx(f4,amp3 - ampoff,'k')
title('Amplitude målinger')
xlim([20 20000])
ylim([-10 10])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
legend('f_0 = 1kHz','f_0 = 1kHz','f_0 = 1kHz','f_0 = 1kHz')
  grid on
print( h1, '-dpng', '-r200', 'test_amp.png')
hold off


h2 = figure(3);
title('Equalizeren er slået fra')
subplot(211)
semilogx(foff,ampoff)
xlim([20 20000])
ylim([-10 10])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
  grid on
subplot(212)
semilogx(foff,phaseoff)

xlim([20 20000])
ylim([-200 200])
xlabel('f [Hz]')
ylabel('\theta [^o]')
  grid on
print( h2, '-dpng', '-r200', 'test_eq_off.png')
hold off
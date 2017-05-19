%% gain: peak filter
clear all, close all, clc

N = 2^10;
fs = 44.1*10^3;
band = 4;

% f = [2000, 2000, 2000, 2000, 4000, 4000, 4000, 4000 ];
f = 1000;
% BW = [100, 100, 10, 50, 1, 5, 10 ,50];
W = 100;
A_v = [5, -5, 7, -7];
G_master_dB = 0;
G_master= 10^(G_master_dB/20);
a = zeros(band,3);
b = zeros(band,3);
filter_type = 'PEAK';
[b(1,:),a(1,:)] = filter_typer(filter_type,W,f,fs,A_v(1));  
[b(2,:),a(2,:)] = filter_typer(filter_type,W,f,fs,A_v(2));  
[b(3,:),a(3,:)] = filter_typer(filter_type,W,f,fs,A_v(3));  
[b(4,:),a(4,:)] = filter_typer(filter_type,W,f,fs,A_v(4));  

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end

H = 20*log10(amp);
figure(1)

semilogx(f,H)
ylabel('[dB]')
xlabel('Hz')
xlim([0 15*10^3])

h1_data = H(1,:);
data1_1 = [f.' h1_data.'];
csvwrite('teori/peak5dB.csv',data1_1);

h2_data = H(2,:);
data1_2 = [f.' h2_data.'];
csvwrite('teori/peakminus5dB.csv',data1_2);

h3_data = H(3,:);
data1_3 = [f.' h3_data.'];
csvwrite('teori/peak7dB.csv',data1_3);

h4_data = H(4,:);
data1_4 = [f.' h4_data.'];
csvwrite('teori/peakminus7dB.csv',data1_4);


%% Bandwidth


clear all, close all, clc

N = 2^10;
fs = 44.1*10^3;
band = 6;

% f = [2000, 2000, 2000, 2000, 4000, 4000, 4000, 4000 ];
f = 1000;
BW = [100, 500, 1000, 100, 500, 1000];
A_v = [5, 5, 5, -5,-5,-5];
G_master_dB = 0;
G_master= 10^(G_master_dB/20);
a = zeros(band,3);
b = zeros(band,3);
filter_type = 'PEAK';
[b(1,:),a(1,:)] = filter_typer(filter_type,BW(1),f,fs,A_v(1));  
[b(2,:),a(2,:)] = filter_typer(filter_type,BW(2),f,fs,A_v(2));  
[b(3,:),a(3,:)] = filter_typer(filter_type,BW(3),f,fs,A_v(3));  
[b(4,:),a(4,:)] = filter_typer(filter_type,BW(4),f,fs,A_v(4));  
[b(5,:),a(5,:)] = filter_typer(filter_type,BW(5),f,fs,A_v(5));  
[b(6,:),a(6,:)] = filter_typer(filter_type,BW(6),f,fs,A_v(6));  

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end

H = 20*log10(amp);
figure(1)

semilogx(f,H)
ylabel('[dB]')
xlabel('Hz')
xlim([0 15*10^3])

h1_data = H(1,:);
data1_1 = [f.' h1_data.'];
csvwrite('teori/bw100.csv',data1_1);

h2_data = H(2,:);
data1_2 = [f.' h2_data.'];
csvwrite('teori/bw500.csv',data1_2);

h3_data = H(3,:);
data1_3 = [f.' h3_data.'];
csvwrite('teori/bw1000.csv',data1_3);

h4_data = H(4,:);
data1_4 = [f.' h4_data.'];
csvwrite('teori/bw100minus.csv',data1_4);

h5_data = H(5,:);
data1_4 = [f.' h5_data.'];
csvwrite('teori/bw500minus.csv',data1_4);

h6_data = H(6,:);
data1_6 = [f.' h6_data.'];
csvwrite('teori/bw1000minus.csv',data1_6);


%% frekvensplacering

clear all, close all, clc

N = 2^10;
fs = 44.1*10^3;
band = 4;

f = [100, 100, 5000, 5000 ];

W = 100;
A_v = [5, -5, 5, -5];
G_master_dB = 0;
G_master= 10^(G_master_dB/20);
a = zeros(band,3);
b = zeros(band,3);
filter_type = 'PEAK';
[b(1,:),a(1,:)] = filter_typer(filter_type,W,f(1),fs,A_v(1));  
[b(2,:),a(2,:)] = filter_typer(filter_type,W,f(2),fs,A_v(2));  
[b(3,:),a(3,:)] = filter_typer(filter_type,W,f(3),fs,A_v(3));  
[b(4,:),a(4,:)] = filter_typer(filter_type,W,f(4),fs,A_v(4));  

f = 0:1:fs/2;

 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end

H = 20*log10(amp);
figure(1)

semilogx(f,H)
ylabel('[dB]')
xlabel('Hz')
xlim([0 15*10^3])
legend('100hz','100hz -dB','5k','5k -dB')

h1_data = H(1,:);
data1_1 = [f.' h1_data.'];
csvwrite('teori/freq_100hz.csv',data1_1);

h2_data = H(2,:);
data1_2 = [f.' h2_data.'];
csvwrite('teori/freq_100hzminus.csv',data1_2);

h3_data = H(3,:);
data1_3 = [f.' h3_data.'];
csvwrite('teori/freq_5k.csv',data1_3);

h4_data = H(4,:);
data1_4 = [f.' h4_data.'];
csvwrite('teori/freq_5kminus.csv',data1_4);

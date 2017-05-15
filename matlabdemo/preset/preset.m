

%% Klassisk preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 4;
F =     [40         6*10^3  14*10^3  16*10^3     ];
G =     [-9        -7      -7        -2          ];
W =     [1          200     400      500         ];
type =  'PEAK';
Master_dB = 2;
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
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_klassik.png')


%% Rock preset
clear all, clc, close all
fs = 44.1*10^3;
N = 2^16;
band = 7;
F =     [20, 60, 170, 310,  600, 6000, 3000];
G =     [-5, 5,  5,   5,   -2,  5, -4, ] ;
W =     [1 , 50, 100, 30, 10, 7000, 1000];
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


 %for j=1:1:band
f = 0:1:fs/2;


 for j=1:1:band
    for i=1:1:length(f)
        amp(j,i) = z_to_freq(a(j,:),b(j,:),f(i),fs);
    end
 end
 %end

H = amp(1,:).*amp(2,:).*amp(3,:).*amp(4,:).*amp(5,:).*amp(6,:).*amp(7,:).*Master;
h1 = figure(1);
semilogx(f,20*log10(abs(H)))
grid on
title('Rock EQ')
xlim( [20 20000])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_rock.png')
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
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('Megaphon EQ')
xlim( [20 20*10^3])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_megafon.png')

%% EMP board kompensering preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 1;
F =     [15915    ];
G =     [4.653       ];
W =     [200            ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer('HSHELV', W(1), F(1),fs,G(1)); 
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
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('EMP board kompensering EQ')
xlim( [20 20*10^3])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_emp komp.png')

%% Bass boost preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 3;
F =     [50 170 310  ];
G =     [6  4 4   ];
W =     [50 100 100   ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

[b(1,:), a(1,:)] = filter_typer(type, W(1), F(1),fs,G(1)); 
[b(2,:), a(2,:)] = filter_typer(type, W(2), F(2),fs,G(2)); 
[b(3,:), a(3,:)] = filter_typer(type, W(3), F(3),fs,G(3)); 
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
h1 = figure(1);
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('Bass Boost EQ')
xlim( [20 20*10^3])
ylim([-5 7])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_bassboost.png')


%% High boost preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 3;
F =     [  6000 9000 16000  ];
G =     [ 6  4 4   ];
W =     [ 500 1000 2000 ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

for j=1:1:band
[b(j,:), a(j,:)] = filter_typer(type, W(j), F(j),fs,G(j)); 
end
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
h1 = figure(1);
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('High Boost EQ')
xlim( [20 20*10^3])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')
print( h1, '-dpng', '-r200', 'eq_highboost.png')

%% Treble and Bass boost preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 6;
F =     [50 170 310  6000 9000 16000  ];
G =     [6  4 4 6  5 5   ];
W =     [50 100 100 1000 1000 2000 ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

for j=1:1:band
[b(j,:), a(j,:)] = filter_typer(type, W(j), F(j),fs,G(j)); 
end
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
h1 = figure(1);
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('Treble and Bass boost EQ')
xlim( [20 20*10^3])
ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')

print( h1, '-dpng', '-r200', 'eq_highbassboost.png')

%% Cut 1k notch preset
clc, clear all, close all
fs = 44.1*10^3;
N = 2^32;
band = 1;
F =     [1000  ];
G =     [-100  ];
W =     [5  ];
type =  'PEAK';
Master_dB = 0;
Master = 10^(Master_dB/20);

b = zeros(band,3);
a = zeros(band,3);

for j=1:1:band
[b(j,:), a(j,:)] = filter_typer(type, W(j), F(j),fs,G(j)); 
end
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
h1 = figure(1);
semilogx(f,20*log10(H),'Linewidth',2)
grid on
title('Cut 1k notch boost EQ')
xlim( [20 20*10^3])
% ylim([-16 16])
xlabel('f [Hz]')
ylabel('|H(f)| [dB]')


print( h1, '-dpng', '-r200', 'eq_1knotch.png')


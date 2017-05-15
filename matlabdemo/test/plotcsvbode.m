function [f,amp,phase] = plotcsvbode(filename,title_name,fignum)

M = csvread(filename);

f = M(:,1);
amp = M(:,4);
phase = M(:,7);
figure(fignum)

subplot(211)

semilogx(f,amp)
title(title_name)
ylim([-20 20])
xlabel('f [Hz]')
ylabel('|H(\omega)| [dB]')
grid on
subplot(212)
semilogx(f,phase)
xlabel('f [Hz]')
ylabel('arg(H(\omega)) [^o]')
grid on


end
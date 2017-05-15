clear all, close all, clc


plotcsvbode('1kNotch_test.csv','1k Notch Profil',1);
[f1,amp1,phase1] = plotcsvbode('BassBoost_test.csv','Bass Boost Profil',2);
[foff,ampoff,phaseoff] = plotcsvbode('EQ_off_test.csv','EQ off Profil',3);
plotcsvbode('Megafon_test.csv','Megafon Profil',4);
plotcsvbode('HighBoost_test.csv','High Boost Profil',5);
plotcsvbode('BassHighBoost_test.csv','High/Bass boost Profil',6);
% plotcsvbode('Rock_test.csv','Rock Profil',7);
    
figure(8)
amp = amp1-ampoff;
phase = phase1 - phaseoff;

semilogx(f1,amp)
clear all, close all, clc




N = 2^10;
fs = 44.1*10^3;
K = 9;


f = [2000, 2000, 2000, 2000, 4000, 4000, 4000, 4000 ];
Q = [1, 5, 10, 50, 1, 5, 10 ,50];
A_v = [5, 5, 5, 5, -5, -5, -5, -5];
G_master_dB = 0;
G_master= 10^(G_master_dB/20);
a = zeros(K,3);
b = zeros(K,3);
filter_type = 'PEAK';
[b(1,:),a(1,:)] = model_filter(filter_type,Q(1),f(1),fs,A_v(1));  
b(1,:) = (1/a(1,1)).*b(1,:);
a(1,:) = (1/a(1,1)).*a(1,:);
[b(2,:),a(2,:)] = model_filter(filter_type,Q(2),f(2),fs,A_v(2));  
b(2,:) = (1/a(2,1)).*b(2,:);
a(2,:) = (1/a(2,1)).*a(2,:);
[b(3,:),a(3,:)] = model_filter(filter_type,Q(3),f(3),fs,A_v(3));  
b(3,:) = (1/a(3,1)).*b(3,:);
a(3,:) = (1/a(3,1)).*a(3,:);
[b(4,:),a(4,:)] = model_filter(filter_type,Q(4),f(4),fs,A_v(4));  
b(4,:) = (1/a(4,1)).*b(4,:);
a(4,:) = (1/a(4,1)).*a(4,:);
[b(5,:),a(5,:)] = model_filter(filter_type,Q(5),f(5),fs,A_v(5));  
b(5,:) = (1/a(5,1)).*b(5,:);
a(5,:) = (1/a(5,1)).*a(5,:);
[b(6,:),a(6,:)] = model_filter(filter_type,Q(6),f(6),fs,A_v(6));  
b(6,:) = (1/a(6,1)).*b(6,:);
a(6,:) = (1/a(6,1)).*a(6,:);
[b(7,:),a(7,:)] = model_filter(filter_type,Q(7),f(7),fs,A_v(7));  
b(7,:) = (1/a(7,1)).*b(7,:);
a(7,:) = (1/a(7,1)).*a(7,:);
[b(8,:),a(8,:)] = model_filter(filter_type,Q(8),f(8),fs,A_v(8));  
b(8,:) = (1/a(8,1)).*b(8,:);
a(8,:) = (1/a(8,1)).*a(8,:);

figure(1)
hold on
 
figure(1)

[h1,w1]= freqz(b(1,:),a(1,:),N,fs);
[h2,w2] = freqz(b(2,:),a(2,:),N,fs);  
[h3,w3] = freqz(b(3,:),a(3,:),N,fs);  
[h4,w4] = freqz(b(4,:),a(4,:),N,fs);  
[h5,w5] = freqz(b(5,:),a(5,:),N,fs);  
[h6,w6] = freqz(b(6,:),a(6,:),N,fs);  
[h7,w7] = freqz(b(7,:),a(7,:),N,fs);  
[h8,w8] = freqz(b(8,:),a(8,:),N,fs);  
 h1_data = 20*log10((abs(h1)));
data1_1 = [w1 h1_data];
csvwrite('p_h1.dat',data1_1);
h2_data = 20*log10((abs(h2)));
data2_2 = [w2 h2_data];
csvwrite('p_h2.dat',data2_2);
h3_data = 20*log10((abs(h3)));
data3_3 = [w3 h3_data];
csvwrite('p_h3.dat',data3_3);
h4_data = 20*log10((abs(h4)));
data4_4 = [w4 h4_data];
csvwrite('p_h4.dat',data4_4);
h5_data = 20*log10((abs(h5)));
data5_5 = [w5 h5_data];
csvwrite('p_h5.dat',data5_5);
h6_data = 20*log10((abs(h6)));
data6_6 = [w6 h6_data];
csvwrite('p_h6.dat',data6_6);
h7_data = 20*log10((abs(h7)));
data7_7 = [w7 h7_data];
csvwrite('p_h7.dat',data7_7);
h8_data = 20*log10((abs(h8)));
data8_8 = [w8 h8_data];
csvwrite('p_h8.dat',data8_8);  
    
 plot(w1,20*log10(abs(h1)));
 hold on
 plot(w1,20*log10(abs(h2)));
 plot(w1,20*log10(abs(h3)));
 plot(w1,20*log10(abs(h4)));
 plot(w1,20*log10(abs(h5)));
 plot(w1,20*log10(abs(h6)));
 plot(w1,20*log10(abs(h7)));
 plot(w1,20*log10(abs(h8)));
    grid;
 title('Peak/notch filtre')
 ylabel('[dB]')
 xlabel('Hz')
xlim([0 15*10^3])
legend('Q=1, G=5','Q=5, G=5','Q=10, G=5','Q=50, G=-5','Q=1, G=-5','Q=5, G=-5','Q=10, G=-5','Q=50, G=-5')
hold off
H = h1.* h2.* h3.* h4.* h5.* h6.* h7.* h8;


%% 
% figure(3)
% atest(1,:) = [1.000000 -1.963039 0.963710];
% btest(1,:) = [0.710416 -1.389627 0.679882];
% atest(2,:) = [1.000000 -1.893763 0.937849];
% btest(2,:) = [1.024185 -1.893763 0.913664];
% atest(3,:) = [1.000000 -1.711592 0.826220];
% btest(3,:) = [0.961972 -1.711592 0.864248];
% atest(4,:) = [1.000000 -1.350605 0.784605];
% btest(4,:) = [1.044429 -1.350605 0.740176];
% atest(5,:) = [1.000000 -1.519605 0.614460];
% btest(5,:) = [1.201305 -1.417053 0.515707];
% [htest1,wtest1]= freqz(btest(1,:),atest(1,:),N,fs);
% [htest2,wtest2] = freqz(btest(2,:),atest(2,:),N,fs);  
% [htest3,wtest3] = freqz(btest(3,:),atest(3,:),N,fs);  
% [htest4,wtest4] = freqz(btest(4,:),atest(4,:),N,fs);  
% [htest5,wtest5] = freqz(btest(5,:),atest(5,:),N,fs);  
% Htest = htest1.*htest2.*htest3.*htest4.*htest5;
% plot(wtest1,20*log10(abs(Htest))),grid;
% 
% figure(4)
% freqz(btest(5,:),atest(5,:),N,fs);
function [b, a] = iir_peak_filter(W,G_dB, f_0,fs)
% preliminary 
w_0 = (2*pi*f_0)/fs;
G_0 = 1;
W = 2*pi*W/fs;


G = 10^(G_dB/20)*G_0;
% A_b = G_dB - 3;
% G_B = 10^(A_b/20);

G_B = sqrt((G_0^2 + G^2)/2);   


beta = sqrt((G_B^2 - G_0^2)/(G^2 - G_B^2))*tan(W/2);

% koefficienter
b_0 = ((G_0 + G*beta)/(1 + beta));
b_1 = -2*((G_0*cos(w_0))/(1+beta));
b_2 =((G_0 - G*beta)/(1 + beta));
a_1 = -2*((G_0*cos(w_0))/(1 + beta));
a_2 = (1 - beta)/(1 + beta);

b = [b_0 b_1 b_2];
a = [1 a_1 a_2];

end 
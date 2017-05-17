function [b, a] = iir_hshelf_filter(W, G_dB, f_0,fs)
% preliminary 
w_0 = (2*pi*f_0)/fs;
G_0 = 1;
G = 10^(G_dB/20)*G_0;
G_B = sqrt((G_0^2 + G^2)/2);   
w_0 = pi - w_0;
beta = sqrt((G_B^2 - G_0^2)/(G^2 - G_B^2))*(tan((w_0)/2));
w_0 = pi;

% koefficienter
b_0 = ((G_0 + G*beta)/(1 + beta));
b_1 = -2*((G_0*cos(w_0))/(1+beta));
b_2 =((G_0 - G*beta)/(1 + beta));
a_1 = -2*((G_0*cos(w_0))/(1 + beta));
a_2 = (1 - beta)/(1 + beta);

b= [b_0 b_1 b_2];
a = [1 a_1 a_2];

end
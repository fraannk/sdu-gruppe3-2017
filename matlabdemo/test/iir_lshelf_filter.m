function [num, denom] = iir_lshelf_filter(W,G_dB, f_0,fs)
% preliminary 
w_0 = (2*pi*f_0)/fs;
f_c = W;
w_c = (2*pi*f_c)/fs;
G_0 = 1;

G = 10^(G_dB/20)*G_0;

G_B = sqrt((G_0^2 + G^2)/2);   


beta = sqrt((G_B^2 - G_0^2)/(G^2 - G_B^2))*tan(w_0/2);

w_0 = 0;
% koefficienter
b_0 = ((G_0 + G*beta)/(1 + beta));
b_1 = -2*((G_0*cos(w_0))/(1+beta));
b_2 =((G_0 - G*beta)/(1 + beta));
a_1 = -2*((G_0*cos(w_0))/(1 + beta));
a_2 = (1 - beta)/(1 + beta);

num = [b_0 b_1 b_2];
denom = [1 a_1 a_2];

end 

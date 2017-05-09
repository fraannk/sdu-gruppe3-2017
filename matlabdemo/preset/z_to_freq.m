function amp = z_to_freq(a,b,f,fs)
  
    Omega = (2*pi*f)/fs;
    %h = (b(1) + b(2)*exp(-j*Omega)+ b(3)*exp(-j*2*Omega))/(a(1) + a(2)*exp(-j*Omega) + a(3)*exp(-j*2*Omega));
    
   num_real = b(1)+ b(2)*cos(Omega)+ b(3)*cos(2*Omega); 
   num_imag = b(2)*sin(Omega) + b(3)*sin(2*Omega);
   
   denom_real = a(1) + a(2)*cos(Omega) + a(3)*cos(2*Omega) ;
   denom_imag = a(2)*sin(Omega) + a(3)*sin(2*Omega) ;
   num =sqrt(num_real^2 + num_imag^2);
   denom =sqrt(denom_real^2 + denom_imag^2);
   amp = num/denom ;
end
function [b,a]= model_filter(filter_type,Q,f_c,fs,A_v)


    w_c = (2*pi*f_c)/fs;
    W = w_c/Q;
    Omega = tan(w_c/2);
    G = 10^((A_v)/20);
    
    switch filter_type
        case 'LS'
       % low shelv
        b = G^(0.5).*[  (G^(0.5)*Omega^2+sqrt(2)*Omega*G^(1/4) + 1)  (2*(G^(1/2)*Omega^2-1))   (G^(1/2)*Omega^2 - sqrt(2)*Omega*G^(1/4) +1 )];
        a = [           (G^(1/2) + sqrt(2)*Omega*G^(1/4) + Omega^2)     (2*(Omega^2 - G^(1/2)))  (G^(1/2)-sqrt(2)*Omega*G^(1/4)+Omega^2)];     

        case 'HS'
        % high shelv
%         w_c = pi-w_c;
        Omega = tan(w_c/2);  
        b = G^(0.5).*[  (G^(0.5)+sqrt(2)*Omega*G^(1/4) + Omega^2) 
                        (-2*(G^(1/2)-Omega^2)) 
                        (G^(1/2) - sqrt(2)*Omega*G^(1/4) +Omega^2 )];
        a = [           (G^(1/2)*Omega^2 + sqrt(2)*Omega*G^(1/4) + 1) 
                        (2*(Omega^2*G^(1/2) - 1)) 
                        (G^(1/2)*Omega^2-sqrt(2)*Omega*G^(1/4)+1)];
   
        case 'PEAK'
        b = [(sqrt(G)+G*tan(W/2)) (-2*sqrt(G)*cos(w_c)) (sqrt(G)-G*tan(W/2))];
        a = [(sqrt(G) + tan(W/2)) (-2*sqrt(G)*cos(w_c)) (sqrt(G)-tan(W/2))];   

        case 'NOTCH'
        b = [(sqrt(G)+G*tan(W/2)) (-2*sqrt(G)*cos(w_c)) (sqrt(G)-G*tan(W/2))];
        a = [(sqrt(G) + tan(W/2)) (-2*sqrt(G)*cos(w_c)) (sqrt(G)-tan(W/2))];

    end
        
 

end
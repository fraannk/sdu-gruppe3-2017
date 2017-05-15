
function [b, a] = filter_typer(filter_name, W, f0,fs,G)
    
    b= zeros(1,3);
    a = zeros(1,3);

    switch filter_name
       
        case 'PEAK'
           [b,a] = iir_peak_filter(W,G,f0,fs);
            
        case 'LSHELV'
            [b,a] = iir_lshelf_filter(W,G,f0,fs);
        case 'HSHELV'
            [b,a] = iir_hshelf_filter(W,G, f0,fs);   
    end
    

end



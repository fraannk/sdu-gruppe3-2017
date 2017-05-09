function out = casked_filter(in,a,b,bands)

    states = zeros(bands,3);
    out = zeros(1,length(in));
    for k=1:1:length(in)
        for i=1:1:bands
            states(i,1) = in(k) - a(i,2)*states(i,2) - a(i,3)*states(i,3);
            out(k)= b(i,1)*states(i,1) + b(i,2)*states(i,2) + b(i,3)*states(i,3);
            states(i,3) = states(i,2);
            states(i,2) = states(i,1);
        end
    end
end
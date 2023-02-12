function Fd12 = calculateConfigFactor(N, sinBetaMin, sinBetaMax, R)
    n = 0;
    S = 0;
    while(n < N)
        n = n+1;
        sinBeta = 1-2*R(n);

        if(sinBeta > sinBetaMin && sinBeta < sinBetaMax)
            S = S+1;
        end
    end
    Fd12 = S/N;
    
end
function out = aproximari(N)
    E = pi/2 * rand(1,N);
    I1=(pi/(2*N))*sum(sin(E))
    I2=pi^2/(8*N)*sum(sin(E)./E);
    out=[I1,I2];

end
function ce_returneaza = nume_functie(N)
x=pi/2*rand(1,N);
I1=pi/(2*N)*sum(sin(x));
I2=pi^2/(8*N)*sum(sin(x)./x);
ce_returneaza = [I1, I2];
end
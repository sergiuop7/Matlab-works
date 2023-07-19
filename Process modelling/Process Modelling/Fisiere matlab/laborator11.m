%ex
clear variables;
N=5000;
x=rand(1,N);
y=rand(1,N);
X=2*x-1;
Y=2*y-1;
n=0;
for i=1:N
    if X(i)^2 + Y(i)^2<=1
        n=n+1;
        plot(X(i),Y(i),'sr');
        hold on
    else plot(X(i),Y(i),'hb');
    end
end
4*n/N

%ex
I1 = rand(1,10);
I2 = rand(1,40);
I3 = rand(1,80);
I=aproximari(100);
I1=I(1)
I2=I(2)

%ex
W = 2;
H = 1;
x = 0.5;

Fd12_ref = 1/2*(W-x)/sqrt((W-x)^2+H^2)+x/sqrt(x^2+H^2);
disp(['Fd12 calculat=', num2str(Fd12_ref)]);

sinBetaMin = -sin(pi/2-atan(H/x));
sinBetaMax = sin(pi/2-atan(H/(W-x)));

N = 100;
R = rand(1,N);

Fd12_approx = calculateConfigFactor(N, sinBetaMin, sinBetaMax, R);
disp(['Fd21_approx = ', num2str(Fd12_approx)]);


function out = aproximari(N)
    E = pi/2 * rand(1,N);
    I1=(pi/(2*N))*sum(sin(E))
    I2=pi^2/(8*N)*sum(sin(E)./E);
    out=[I1,I2];

end


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


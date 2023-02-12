clear variables;
N=50000;
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

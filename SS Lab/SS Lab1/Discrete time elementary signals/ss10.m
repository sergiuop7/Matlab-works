%exponential sequence
a = 0.2; b = 0.5;
n1 = 0; n2 = 10; n = n1:n2;
xe = a*b.^n;
stem(n, xe)
xlabel('n'); ylabel('x_e[n]'); title('x_e[n] = a b^n')

a = 0.2; b = 0.5;
n1 = 0; n2 = 10; n = n1:n2;
xe = @(n) (a*b.^n);
stem(n, xe(n))
xlabel('n'); ylabel('x_e[n]'); title('x_e[n] = a b^n')

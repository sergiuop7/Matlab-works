% Autocorrelation function:
function phi = autocorrelation(x,N,M)
if(length(x) < M+N)
phi = [];
return
end
phi = zeros(1,N);
for n = 1:N
for k = n+1:n+M
phi(n) = phi(n) + x(k) * x(k-n);
end
end
phi = phi / M;
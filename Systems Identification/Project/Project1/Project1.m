clear variables

load('product_1.mat')
%%1
k = transpose(time);

y = transpose(y);

phi = [ones(length(k), 1), k, cos(2*pi/12),  sin(2*pi/12), cos(4*pi/12),  sin(4*pi/12)]

theta = phi \ y

%%2
%for with the formula of f(k)
y_hat = theta(1) + theta(2) * k + theta(3) .* (k .^ 2)

%%3
plot(k, y, '*', k, y_hat, 'b');

%%4
N = length(k);
err_squared = (y - y_hat) .^ 2;
MSE = (1/N) * sum(err_squared)

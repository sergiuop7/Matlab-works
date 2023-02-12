clear variables

load('lab2_01.mat')

plot(id.X, id.Y)

x_id = transpose(id.X);
y_id = transpose(id.Y);

n = 20;
N = length(id.Y);

phiid = zeros(N, n);

for i = 1 : 1 : N
    for j = 1 : 1 : n
        phiid(i,j) = x_id(i) ^ (j-1);
    end
end

theta = phiid \ y_id;
y_hat_id = phiid * theta;

figure
plot(y_id)
hold on
plot(y_hat_id)
hold off

MSE_id = (1/N) * sum((y_id - y_hat_id) .^ 2);

%% validation

load('lab2_01.mat')

plot(val.X, val.Y)

x_val = transpose(val.X);
y_val = transpose(val.Y);

n = 20;
N = length(val.Y);

phival = zeros(N, n);

for i = 1 : 1 : N
    for j = 1 : 1 : n
        phival(i,j) = x_val(i) ^ (j-1);
    end
end

y_hat_val = phival * theta;

figure
plot(y_val)
hold on
plot(y_hat_val)
hold off

MSE_val = (1/N) * sum((y_val - y_hat_val) .^ 2);

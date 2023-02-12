clear variables

%% first order system

%load and plot data(t vs u, t vs y)
load('lab3_order1_1.mat')

u = data.u;
y = data.y;
figure
plot(t,u)
hold on
plot(t,y)
hold off

%extraction of identification and validation data
u_id = u(1:100);
y_id = y(1:100);
u_val = u(201:500);
y_val = y(201:500);
t_id = t(1:100);
t_val = t(201:500);

figure
plot(t_id,u_id)
title('u');
figure
plot(t_id,y_id)
title('y');

%finding the first order system step response parameters
yss = mean(y_id(80:100))
y0 = 0;
uss = mean(u_id(80:100))
u0 = 0;
k = (yss - y0) / (uss - u0)
yofT = 0.632 * yss
T = 4
H_first_order = tf(k, [T, 1])


%finding and plotting the approximation for the identification data
yhat_id = lsim(H_first_order, u_id, t_id);
figure
plot(t_id,y_id)
hold on
plot(t_id,yhat_id)
hold off

%computing the MSE for identification data
N = length(y_id);
err_squared = (y_id - yhat_id) .^ 2;
MSEid_first_order = (1/N) * sum(err_squared);

%finding and plotting the approximation for the validation data
yhat_val = lsim(H_first_order, u_val, t_val);
figure
plot(t_val,y_val)
hold on
plot(t_val,yhat_val)
hold off

%computing the MSE for validation data
N = length(y_val);
err_squared = (y_val - yhat_val) .^ 2;
MSEval_first_order = (1/N) * sum(err_squared);

%% second order system

%load and plot data(t vs u, t vs y)
load('lab3_order2_1.mat')

u = data.u;
y = data.y;
figure
plot(t,u)
hold on
plot(t,y)
hold off

%extraction of identification and validation data
u_id = u(1:100);
y_id = y(1:100);
u_val = u(201:500);
y_val = y(201:500);
t_id = t(1:100);
t_val = t(201:500);

figure
plot(t_id,u_id)
title('u');
figure 
plot(t_id,y_id)
title('y');

%finding the second order system step response parameters
yss = mean(y_id(80:100))
y0 = 0;
uss = mean(u_id(80:100))
u0 = 0;
k = (yss - y0) / (uss - u0)
yofT1 = 3.5;
M = (yofT1 - yss) / (yss - y0);
yofT3 = 3;
T0 = 4.83-1.68;
zeta = log(1/M)/(sqrt((pi^2)+log(M)*log(M)))
zeta = 0.5;
wn = (2*pi)/(T0*sqrt(1-zeta*zeta))
wn = 2;
H_second_order = tf(k*wn^2, [1 2*zeta*wn wn^2])

%finding and plotting the approximation for the identification data
yhat_id = lsim(H_second_order, u_id, t_id);
figure
plot(t_id,y_id)
hold on
plot(t_id,yhat_id)
hold off

%computing the MSE for identification data
N = length(y_id);
err_squared = (y_id - yhat_id) .^ 2;
MSEid_second_order = (1/N) * sum(err_squared);

%finding and plotting the approximation for the validation data
yhat_val = lsim(H_second_order, u_val, t_val);
figure
plot(t_val,y_val)
hold on
plot(t_val,yhat_val)
hold off

%computing the MSE for validation data
N = length(y_val);
err_squared = (y_val - yhat_val) .^ 2;
MSEval_second_order = (1/N) * sum(err_squared);

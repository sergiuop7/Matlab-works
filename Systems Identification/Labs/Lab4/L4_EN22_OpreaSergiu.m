clear variables

%% first order system

%load and plot data(t vs u, t vs y)
load('lab4_order1_1.mat')

u = data.u;
y = data.y;
figure
plot(t,u)
hold on
plot(t,y)
hold off

%extraction of identification and validation data

u_id = u(1:110);
y_id = y(1:110);
u_val = u(111:330);
y_val = y(111:330);
t_id = t(1:110);
t_val = t(111:330);

figure
plot(t_id,u_id)
title('u');
figure
plot(t_id,y_id)
title('y');

%finding the second order system impulse response parameters
yss = mean(y_id(80:100));
y0 = yss;
uss = mean(u_id(80:100));
K = yss/uss;
K = 3;
y_max = 2.24;
yofT = y0 + 0.368 * (y_max-y0);
T = 14-10;
H_first_order = tf(K, [T,1])

%plot the approximation for the identification data
A = -1/T;
B = K/T;
C = 1;
D = 0;
Hs = ss(A, B, C, D);

yhat_id = lsim(Hs, u_id, t_id, y0);
figure 
plot(y_id)
hold on
plot(yhat_id)

%computing the MSE for identification data
N = length(y_id);
err_squared = (y_id - yhat_id) .^ 2;
MSEid_first_order = (1/N) * sum(err_squared);

%finding and plotting the approximation for the validation data
yhat_val = lsim(Hs, u_val, t_val, y0);
figure 
plot(y_val)
hold on
plot(yhat_val)

%computing the MSE for validation data
N = length(y_val);
err_squared = (y_val - yhat_val) .^ 2;
MSEval_first_order = (1/N) * sum(err_squared);

%plotting the approximation for the entire dataset
yhat = lsim(Hs, u, t, y0);

figure 
plot(y)
hold on
plot(yhat)

%% second order system

%load and plot data(t vs u, t vs y)
load('lab4_order2_1.mat')

u = data.u;
y = data.y;
figure
plot(t,u)
hold on
plot(t,y)
hold off

%extraction of identification and validation data
u_id = u(1:110);
y_id = y(1:110);
u_val = u(111:330);
y_val = y(111:330);
t_id = t(1:110);
t_val = t(111:330);

figure
plot(t_id,u_id)
title('u');grid;
figure
plot(t_id,y_id)
hold on
yline(yss)
hold off
title('y');grid;

%finding the second order system impulse response parameters
yss = mean(y_id(90:110));
y0 = yss;
uss = mean(u_id(90:110));
k = yss/uss
T0=3.45 - 1.85;

Ts = t(5)-t(4);
t00 = 1.5;
t01 = 2.38;
t02 = 3.24;
k00 = t00/Ts;
k01 = t01/Ts;
k02 = t02/Ts;
Aplus = Ts*sum(y(30:48)-y0)
Aminus = Ts*sum(y0-y(48:65))

M = Aminus/Aplus

zeta = log(1/M)/(sqrt((pi^2)+log(M)*log(M)))
wn = (2*pi)/(T0*sqrt(1-zeta*zeta)) 
wn = 4;
H_second_order = tf(k*wn^2, [1 2*zeta*wn wn^2])

%plot the approximation for the identification data
A = [0 1;
    -wn^2 -2*zeta*wn];
B = [0;
    k*wn^2];
C = [1 0];
D = 0;
Hs = ss(A, B, C, D);

yhat_second_order_id = lsim(Hs, u_id, t_id, [y0,0]);

figure 
plot(y_id, 'r')
hold on
plot(yhat_second_order_id,'b')

%computing the MSE for identification data
N = length(y_id);
err_squared = (y_id - yhat_second_order_id) .^ 2;
MSEid_second_order_id = (1/N) * sum(err_squared);


%plot the approximation for the validation data
yhat_second_order_val = lsim(Hs, u_val, t_val, [y0,0]);

figure 
plot(y_val, 'r')
hold on
plot(yhat_second_order_val,'b')

%computing the MSE for validation data
N = length(y_id);
err_squared = (y_val - yhat_second_order_val) .^ 2;
MSEid_second_order_val = (1/N) * sum(err_squared);

%plotting the approximation for the entire dataset
yhat_second_order = lsim(Hs, u, t, [y0,0]);

figure 
plot(y)
hold on
plot(yhat_second_order)

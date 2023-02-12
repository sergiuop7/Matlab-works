clear variables

%load and plot data(u and y with respect to time t)
load('lab5_1.mat')

figure
plot(id)
figure
plot(val)

%check if the input is zero-mean, if not we make it like that
figure
plot(tid, id.u);
uid = detrend(id.u);
figure
plot(tid, uid);

figure
plot(tid, id.y);
yid = detrend(id.y);
figure
plot(tid, yid);

uval = detrend(val.u);
yval = detrend(val.y);

stem(imp)
%picking the value where the system goes in steady state
M = 50;

%building the correlation functions ru and ryu 
N = length(yid);
ru = zeros(1,N);
ryu = zeros(1,N);

for tau = 1:1:N
    for k = 1:1:(N-tau+1)
       ru(tau) = ru(tau) + (1/N) * (uid(k+tau-1)*uid(k));
       ryu(tau) = ryu(tau) + (1/N) * (yid(k+tau-1)*uid(k));  
    end
end

%building Ru and Ryu from the linear system in order to obtain weighting function H
Ru = zeros(N, M);
Ryu = transpose(ryu);

for i = 1:1:N
    for j = 1:1:M
        Ru(i,j) = ru(abs(i-j)+1);
    end
end

H = Ru \ Ryu;

%using the FIR model
%% identification
%we are obtaining the approximation by computing the convolution between
%the input data and the weighting function
y_approximated_id = conv(uid, H);
y_approximated_id = y_approximated_id(1:length(uid));

figure
plot(tid, yid, tid, y_approximated_id);
legend('Identification data', 'Approximated data')

MSE_id = (1/N) * sum((yid - y_approximated_id) .^ 2);
%% validation
%we are obtaining the approximation by computing the convolution between
%the input data and the weighting function
y_approximated_val = conv(uval, H);
y_approximated_val = y_approximated_val(1:length(uval));

plot(tval, yval, tval, y_approximated_val);
legend('Validation data', 'Approximated data')

MSE_val = (1/N) * sum((yval - y_approximated_val) .^ 2);

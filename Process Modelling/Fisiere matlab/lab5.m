%% Lab 5 exercises

I_measured = [0, 0, 0, 0, 0.0002, 0, 0.0002, 0, 0.0002, 0.0002, 0.0001, ...
    0.0006, 0.00189, 0.00389, 0.00598, 0.00807, 0.01027, 0.01445, ...
    0.01664, 0.01874, 0.02083, 0.02302, 0.02512, 0.02950]';
V_measured = [0, 0.36091, 0.71343, 1.07434, 1.25060, 1.43525, 1.61151, ...
    1.79616, 1.97242, 2.33333, 2.50959, 2.68585, 2.87050, 2.98801, ...
    3.08034, 3.12230, 3.16427, 3.23981, 3.27338, 3.31535, 3.34053, ...
    3.35731, 3.38249, 3.43285]';


I1 = I_measured(1:11);
V1 = V_measured(1:11);

f = fit(V1, I1, 'poly1');
c = coeffvalues(f);
a = c(1)
b = c(2)

% I = a * V + b

I1_aprox = a * V1 + b;

%%

f = fit(V_measured(11:13), I_measured(11:13), 'poly1');
c = coeffvalues(f);
a = c(1); b = c(2);

I2_aprox = a * V_measured(11:13) + b;

% aici am continua sa facem acelasi lucru pana trecem prin toate punctele

hold on;
plot(V1, I1_aprox)
plot(V_measured(11:13), I2_aprox)
%plot(restul)
plot(V_measured, I_measured, '.')
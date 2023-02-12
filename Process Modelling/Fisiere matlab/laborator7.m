clear variables; 
Ms = 300; % [kg]
Ks = 2800; % [N/m]
Bs = 2000; % [N sec/m]
Mu = 30; % [kg]
Kt = 21000; % [N/m]
global A B;
A = [ 0 -Kt 0 0;
 1/Mu -Bs/Mu -1/Mu Bs/Mu;
 0 Ks 0 -Ks;
 0 Bs/Ms 1/Ms -Bs/Mu];
B = zeros(4, 1);
B(1, 1) = Kt;
y0 = zeros(1, 4); % matrix for state variables
[t, y] = ode23(@suspensie_ode, [0, 10], y0);
zu_speed = y(:, 2);
zs_speed = y(:, 4);
% prealocation
zu = zeros(1, length(zu_speed) - 1);
zs = zeros(1, length(zs_speed) - 1);
% in order to compute the distance, we integrate
for i = 2:length(zs_speed)
 zu(i) = trapz(t(1:i), zu_speed(1:i));
 zs(i) = trapz(t(1:i), zs_speed(1:i));
end
figure,
subplot(5, 1, 1), plot(t, zu_speed),
subplot(5, 1, 2), plot(t, zs_speed),
subplot(5, 1, 3), plot(t, road(t)),
subplot(5, 1, 4), plot(t, zu),
subplot(5, 1, 5), plot(t, zs);


function dxdt = suspensie_ode(t, x)
    global A B;
    dxdt = A * x + B * road(t);
end

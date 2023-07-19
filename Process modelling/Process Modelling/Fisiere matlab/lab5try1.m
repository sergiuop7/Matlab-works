clear variables;
global A B;

D = .42;
Fsw = 400*10^3; 
Tsw = 1/Fsw;
ti = 0;
x0 = [1,3];
t = [];
x = [];

Rds = 0.02;
Rl = 0.037;
Rc = 0.025;
Rld = 2.5;
L = 12 * 10^(-3);
C = 47 * 10^(-3);
Vd = 0.4;

A = [(-1/L)*(Rds+Rl+Rc*Rld/(Rld+Rc))   (-1/L)*(1-Rc/Rld+Rc);
        (1/C)*(Rld/(Rld+Rc))           (-1/C)*(1/(Rld+Rc))];
B = [1/L 0];

for i = 1:400
 %on
 [ton, xon] = ode23('buck_on', [ti, ti+D*Tsw], x0);
 x0 = xon(end, :);
 ti = ton(end);
 t = [t; ton];
 x = [x; xon];
 
 %off
 [toff, xoff] = ode23('buck_off', [ti, ti+(1-D)*Tsw], x0);
 x0 = xoff(end, :);
 ti = toff(end);
 t = [t; toff];
 x = [x; xoff];
end
figure,
subplot(2,1,1);
plot(t,x(:, 1)); grid;
ylabel('i_L (A)'); title('curentul prin bobina');
subplot(2,1,2);
plot(t, x(:, 2));grid;
ylabel('v_C(V)');title('Tensiunea pe condensator');
xlabel('Time(sec.)');
Vout = figure;
plot(t, Vout); grid;
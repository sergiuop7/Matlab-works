clear variables

Hf1 = tf(2.4, conv([0.5, 1], [50, 1]))
Hf2 = tf(8.6, conv([0.01, 1], [0.6, 1]))

T2 = 0.01;
Hd_m = tf(1, [2*T2^2 2*T2 0]);
Hr2 = Hd_m / Hf2

Hf = Hf1*Hd_m/(1+Hd_m)
Ho2 = Hd_m / (1+Hd_m)
minreal(Ho2)
T = 1/50;

T1 = 0.5+T
Hd_s = tf([4*T1 1], [8*T1^3 8*T1^2 0 0])
Hr1 = Hd_s/Hf1

Ho1 = Hd_s / (1+Hd_s)
step(Ho1), hold on


%%
Hf = Hf1 * Hf2;
T_par = T2+0.5+0.6;
Hd_sym = tf([4*T_par,1], conv([8*T_par^2,0,0],[T_par,1]));
Hr = Hd_sym/Hf;

step(feedback(Hr*Hf,1));
hold off
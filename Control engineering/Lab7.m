clear variables

%% a
Hf = tf(2, [1, 1]);
T = 1;
Hd_m = tf(1, [2*T*T 2*T 0])
Hd_s = tf([4*T 1], [8*T^3 8*T^2 0 0])
Hr_m = Hd_m/Hf
Hr_s = Hd_s/Hf
minreal(Hr_m)
minreal(Hr_s)

%% b
Hf = tf(2, [1, 1, 0]);
T = 1;
Hd_m = tf(1, [2*T*T 2*T 0]);
Hd_s = tf([4*T 1], [8*T^3 8*T^2 0 0]);
Hr_m = Hd_m/Hf
Hr_s = Hd_s/Hf
minreal(Hr_m)
minreal(Hr_s)

%% c
Hf = tf(2, conv([1 1], [10 1]));
T = 1;
Hd_m = tf(1, [2*T*T 2*T 0]);
Hd_s = tf([4*T 1], [8*T^3 8*T^2 0 0]);
Hr_m = Hd_m/Hf
Hr_s = Hd_s/Hf
minreal(Hr_m)
minreal(Hr_s)

%% d
Hf = tf(2, conv([1 0], conv([1 1], [10 1])));
T = 2;
Hd_m = tf(1, [2*T*T 2*T 0]);
Hd_s = tf([4*T 1], [8*T^3 8*T^2 0 0]);
Hr_m = Hd_m/Hf
Hr_s = Hd_s/Hf
minreal(Hr_m)
minreal(Hr_s)
zpk(Hr_m)
zpk(Hr_s)

figure
step(feedback(Hd_m,1), 'r'); hold on
Hr_new = tf([0.0625*11, 0.0625], [1 0.5]);
step(feedback(Hr_new*Hf,1), 'b'); hold off

figure
step(feedback(Hd_s,1), 'r'); hold on
Hr_new = tf([0.0625 * conv([11 1], [1 0.125])], [1 0.5 0]);
step(feedback(Hr_new*Hf,1), 'b'); hold off

%% e
Hf = tf(2, conv([1 1], conv([10 1], [20 1])));
T = 1;
Hd_m = tf(1, [2*T*T 2*T 0]);
Hd_s = tf([4*T 1], [8*T^3 8*T^2 0 0]);
Hr_m = Hd_m/Hf
Hr_s = Hd_s/Hf
minreal(Hr_m)
minreal(Hr_s)
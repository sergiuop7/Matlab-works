% Dahlin (Vogel-Edgar)
hf = tf(0.2, [150, 53, 1], 'iodelay', 2);
T = 1;
hfz = c2d(hf, T, 'zoh');
[num, den] = tfdata(hfz, 'v');
b1 = num(2); b2 = num(3); a1 = den(2); a2 = den(3); %b1 and b2 are both positive and very close
lambda = 25; %Imposed ts = 102 = 4*lambda+taum
format long;
hclz = tf((1-exp(-T/lambda))*[b1, b2], (b1+b2)*[1, -exp(-T/lambda), 0, 0, 0, 0], T); %course formula
figure
step(hclz); %in order to verify the values chosen and the computations up to this point
title('theoretical Hcl');
hrz = tf((1-exp(-T/lambda))*[1, a1, a2, 0],...
    [(b1+b2), -(b1+b2)*exp(-T/lambda), 0, -b1*(1-exp(-T/lambda))-b2*(1-exp(-T/lambda))], T); %course formula without ringing
hrz2 = tf((1-exp(-T/lambda))*[1, a1, a2, 0, 0],...
    [b1, b2-b1*exp(-T/lambda), -b2*exp(-T/lambda), -b1*(1-exp(-T/lambda)), -b2*(1-exp(-T/lambda))], T); %course formula with ringing

figure
step(feedback(hrz*hfz,1)); title('actual Hcl');
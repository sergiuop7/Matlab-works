clear variables;
Q=[0 20 40 60 80 100 120 140 160]
H=[23 21 20.5 20 18.5 17 15 13 10]

plot(fit(transpose(Q),transpose(H),'poly2'))


clear variables;

global H1 a f12 f23 f31 r2 r3;

H1 = 30.48;
r2 = 0.0425;
r3 = 0.085;

D = [0.254 0.3048 0.254];
L = [304.8 304.8 457.2];

Chw = 120;

fk = (10.7 * L) ./ (Chw^1.852 .* D.^4.87);
f12 = fk(1);
f23 = fk(2);
f31 = fk(3);
a=1;
H1 = fsolve('hidraulic_ntwk',[0;0])



function out = hidraulic_network2(x)
    global H1 a f12 f13 f23 r2 r3;
    % x e un vector care contine necunoscutele
    H2 = x(1);
    H3 = x(2);
           
    out = [(sign(H1-H2) * ((abs(H1-H2)/f12) ^ a)) - (sign(H2-H3) * ((abs(H2-H3)/f23) ^ a) - r2);  % H2
           (sign(H1-H3) * ((abs(H1-H3)/f13) ^ a)) + (sign(H2-H3) * ((abs(H2-H3)/f23) ^ a) - r3)]; % H3
end

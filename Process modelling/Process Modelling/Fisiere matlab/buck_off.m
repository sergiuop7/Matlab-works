function dx = buck_off(t,x)
Rl = .037;
L = 12.e-6;
Rc = .025;
C = 47.e-6;
Vd = 0.4;
Rld = 2.5;
 dx = [-1/L*(Rl+Rc*Rld/(Rc+Rld))*x(1,1)-1/L*Rld/(Rc+Rld) + 1/L*Vd;
 1/C*(Rld/(Rc+Rld)*x(1,1)-1/(Rc+Rld)*x(2,1))];
end
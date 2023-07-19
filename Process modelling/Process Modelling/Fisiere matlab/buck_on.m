function dx = buck_on(t,x)
Rds = .02;
Rl = .037;
L = 12.e-6;
Rc = .025;
C = 47.e-6;
Vin = 12;
Rld = 2.5;
 dx = [-1/L*(Rds+Rl+Rc*Rld/(Rc+Rld))*x(1,1)-1/L*(1-Rc/(Rc+Rld))*x(2,1) + 1/L*Vin;
 1/C*(Rld/(Rc+Rld)*x(1,1)-1/(Rc+Rld)*x(2,1))];
end
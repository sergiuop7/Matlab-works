function dxdt1 = suspensie_ode1(t,x)
global A B;
dxdt1=A*x(t)+B*z_r1(t)
end
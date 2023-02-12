function dx=RLC3_3(t,x)
    R=1e3;
    C=1e-6;
    L=1e-3;
    w=(L*C)^(-0.5);
    u=sin(10*t*w);
    dx=[-1/R/C*x(1)-1/C*x(2)+1/R/C*u;1/L*x(1)];
end
function dxdt = suspensie_ode(t, x)
    global A B;
    dxdt = A * x + B * road(t);
end
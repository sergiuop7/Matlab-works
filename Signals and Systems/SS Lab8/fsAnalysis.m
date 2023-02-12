function ak = fsAnalysis(x, t, T0, Ts, N)

% exraction of one period from x
    t = t(1:floor(T0/Ts));
    x = x(1:length(t));
    
% estimation of the coeffiecients using the trapezoidal method
    w0 = 2*pi/T0;
    ak = [];
    for k = -N:N
        ak = [ak, (1/T0)*trapz(t, x.*exp(-j*k*w0*t))];
    end
end

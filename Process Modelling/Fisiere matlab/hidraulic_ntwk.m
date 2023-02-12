function out = hidraulic_ntwk(x)
global H1 a f12 f23 f31 r2 r3;
    H2 = x(1);
    H3 = x(2);
    out = [(sign(H1-H2)*((abs(H1-H2))^a)/f12) - (sign(H2-H3)*((abs(H2-H3))^a)/f23) - r2;
          (sign(H2-H3)*((abs(H2-H3))^a)/f23) + (sign(H3-H1)*((abs(H3-H1))^a)/f31) - r3;];

end
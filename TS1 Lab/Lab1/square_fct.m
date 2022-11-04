function u = square_fct(t,w)
    x(1:1000) = 1
    x(1001:2000) = -1;
    x = repmat(x,1,3);
    x = transpose(x);
    u = x;
end
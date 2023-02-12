function out = functietestcolocviu(t,in)

x = in(1);
v = in(2);
w = 1;

out = [v;
       -w^2*x];

end
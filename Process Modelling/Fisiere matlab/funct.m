function rezultate = funct(t,in)

x=in(1);
y=in(2);
z=in(3);

dx=10*(y-x);
dy=-x*z+28*x-y;
dz=x*y-8*z/3;

rezultate=[dx,dy,dz]';

end
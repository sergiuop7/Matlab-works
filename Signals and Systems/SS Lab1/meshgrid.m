clear variables;

[t,p]=meshgrid(0:.02*pi:3*pi,0:.02*pi:3*pi);
figure, surf(t,p,t/2*sin(p)), xlabel('t'), ylabel('p'), title('t/2 sin(p)')
view(40, 60)
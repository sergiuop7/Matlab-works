clear variables;

t = 0:0.01*pi:2*pi;
x = cos(2*pi*t); y = sin(2*pi*t); z = t;
plot3(x,y,z, 'LineWidth', 2); grid; view(20,30)
xlabel('x'), ylabel('y'), zlabel('z'),

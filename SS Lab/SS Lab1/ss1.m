x = -pi:0.02*pi:pi;
plot(x,max(sin(x), cos(x)), 'c', 'LineWidth', 5);
hold on
plot(x,sin(x),'--b', x, cos(x), '-r' , 'LineWidth',3); 
grid
axis([-pi, pi, -1.1, 1.1]), set(gca,'FontSize',12)

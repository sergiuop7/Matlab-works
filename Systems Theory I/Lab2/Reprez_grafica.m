t=0:0.2:10; % timp de simulare
%%% varianta copiata din s.x2 %%%
ys=(2*3^(1/2)*sin((3^(1/2)*t)/2))./(3*exp(t).^(1/2));
%%% varianta explicata in lucrare %%%
yl=2*sqrt(3)/3*sin(sqrt(3)/2*t).*exp(-t/2);
plot(t,ys,'^-',t,yl,'v');
legend('ys=(2*3^(1/2)*sin((3^(1/2)*t)/2))./(3*exp(t).^(1/2))','yl=2*sqrt(3)/3*sin(sqrt(3)/2*t).*exp(-t/2);')

text(4,0.4,'$y(t)=\frac{2\sqrt3}{3}sin(\frac{\sqrt{3}}{2}t)e^{-\frac{t}{2}}$','Interpreter','latex','FontSize',20)

title('Semnalul de ie\c{s}ire','Interpreter','latex');
xlabel('Timp (sec.)');ylabel('Amplitudine')
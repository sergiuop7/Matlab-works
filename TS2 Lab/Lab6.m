clear variables

tau = 0.2;
Hdes = tf(12, [1, 5, 0], 'IOdelay', tau)
bode(Hdes)
wc = 2.2;
axis([0.1 100 -270 0]);
handles=findobj(gcf,'Type','axes');
axes(handles(2));
hold on
semilogx(wc, 0, '*');
t = logspace(-1, 2, 1e2);
semilogx(t, 0, "g*");
axes(handles(1));
w_pi = 4.33;
semilogx(w_pi, -180, '*');
t = logspace(-1, 2, 1e2);
semilogx(t, -180, "r*");
semilogx([wc,wc],[-180,-139], 'm', 'LineWidth', 2);
semilogx(wc, -139, 'm*', 'LineWidth',2);
mk = -7.4;
semilogx([w_pi,0],[w_pi,mk], 'm', 'LineWidth', 2);


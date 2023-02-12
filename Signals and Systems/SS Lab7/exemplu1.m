sx = -7; ex = 0;
sy = 0; ey = 7;

dtx = sx:ex;
dty = sy:ey;
dtw = sx+sy : ex+ey;

x = (-1).^dtx;
y = ones(1, ey-sy+1);
w = conv(x,y);

subplot(3,1,1); stem(dtx, x); xlabel('n'); ylabel('x[n]');
subplot(3,1,2); stem(dty, y); xlabel('n'); ylabel('y[n]');
subplot(3,1,3); stem(dtw, w); xlabel('n'); ylabel('w[n]');
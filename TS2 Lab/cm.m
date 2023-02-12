%clear variables

function [] = cm(MdB)
%MdB = 2; %modulul in dB
M = 10^(MdB/20) %modulul netransformat in dB

r = M/(M^2-1);
cx = - M*r;
x = 0:0.01:2*pi;
sdf = roots([-4 0 4 0 -1/M^2])
df = sdf(4);
sigma = round(exp(-pi*df/sqrt(1-df^2)) * 100)
plot(r*sin(x)+cx, r*cos(x), 'r'); shg; grid
text(cx,r, [num2str(MdB),' dB, \sigma=', num2str(sigma)], 'Color', 'm')
end





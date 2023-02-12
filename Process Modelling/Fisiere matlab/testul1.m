turi=-2:0.1:10;
timpuri1=0:0.1:100;
[timpuri,uo]=ode23(@derivata,timpuri1,0);
yuri = zeros(1, length(turi));
for i=1:length(turi)
    yuri(i)=ui(turi(i));
end
hold on;
plot(turi,yuri)

plot(timpuri,uo)
function duo=derivata(t,uo)
duo=1/(0.001*10000)*(ui(t)-uo);
end
function y=ui(t)
if(t>=0 && t<=4) 
    y=-t^2+4*t;
else 
    y=0;
end
end
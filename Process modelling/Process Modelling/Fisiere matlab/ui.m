turi=-2:0.1:10
for i=1:length(turi)
    yuri(i)=ui(turi(i));
end
plot(turi,yuri)
function y=ui(t)
if(t>=0 && t<=4) 
    y=-t^2+4*t;
else 
    y=0;
end
end
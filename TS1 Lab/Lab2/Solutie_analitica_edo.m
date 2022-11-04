clear variables

R=1; C=1; L=1; u=1;
%s=dsolve('Dx1=-1/L/C*x2','Dx2=x1-1/R/C*x2+1/R/C*u','x1(0)=0','x2(0)=0');
s=dsolve('Dx1=-x2','Dx2=x1-x2+1','x1(0)=0','x2(0)=0');
pretty(s.x2)

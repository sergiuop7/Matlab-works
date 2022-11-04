%%% fisier de tip “function”
%%% se salveaza fisierul cu numele RLC1%%
function dx=RLC1(t,x)
R=1;L=1;C=1;    %parametrii circuitului
u=1; %semnal de intrare 
dx=[-1/L/C*x(2); x(1)-1/R/C*x(2)+1/R/C*u];
end
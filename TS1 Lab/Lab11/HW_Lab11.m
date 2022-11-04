clear variables

Hd = tf([1 2], conv(conv([1 1],[1 3]),[1 5]))
k = [0.5 1  1.5  3  10  20  30 100]
for i = 1 : length(k)
    step(feedback(k(i) * Hd,1));
    stepinfo(feedback(k(i) * Hd,1))
    hold on;
end
legendStrings = "k = " + string(k);
legend(legendStrings);

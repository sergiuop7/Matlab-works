clear variables

Hc = tf(60,[1,12])
Hdes = series(Hc, H0)
rlocus(Hdes)
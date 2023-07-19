function zr_t = road(t)
    zr_t = 0.1 * sin(20 * t) + 0.03 * sign(sin(5 * t)) + 0.02 * sign(sin(2 * t));
end
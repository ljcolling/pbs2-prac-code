function ci = MyCiFun(input)

    n = length(input);
    sd = std(input);
    ci = 1.96 * sd/sqrt(n);
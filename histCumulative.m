function cdf=histCumulative(histVal)
    cdf = zeros(256);
    cdf(1) = histVal(1);
    for x = 2:256
        cdf(x) = cdf(x - 1) + histVal(x);
    end
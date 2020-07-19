function imgCopy=contrastHistogramEqualized(img)
    [width, height] = size(img);
    px = width * height;
    histogram = histFor(img, 1);
    cumulativeVals = histCumulative(histogram);
    
    imgCopy = img;
    for x = 1:width
        for y = 1:height
            val = img(x, y) + 1;
            imgCopy(x, y) = uint8(255 * (cumulativeVals(val) / px));
        end
    end
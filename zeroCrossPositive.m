function val=zeroCrossPositive(img, x, y)
    max = 0;
    min = 0;
    for neighborX=-1:1
        for neighborY=-1:1
            pxVal = pxInBounds(img, x + neighborX, y + neighborY, 1);
            if pxVal > max
                max = pxVal;
            end
            if pxVal < min
                min = pxVal;
            end
        end
    end
    
    if max == 0 || min == 0
        val = 0;
    else
        val = max - min;
    end
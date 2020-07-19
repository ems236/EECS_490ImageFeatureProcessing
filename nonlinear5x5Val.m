function newVal=nonlinear5x5Val(img, x, y, color, func)
    %does the + shape instead of a square
    CENTER = 3;
    vals = zeros(9, 1);
    for maskX = 1:5
        offsetX = maskX - CENTER;
        pxVal = pxInBounds(img, x + offsetX, y, color);
        vals(maskX) = pxVal;
    end
    
    yVals = [1, 2, 4, 5];
    for maskY = 1:4
        offsetY = yVals(maskY) - CENTER;
        pxVal = pxInBounds(img, x, y + offsetY, color);
        vals(5 + maskY) = pxVal;
    end
    
    %disp(vals);
    %disp(median(vals));
    newVal = func(vals);
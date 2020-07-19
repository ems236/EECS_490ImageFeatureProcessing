function newVal=nonlinearVal(img, x, y, color, func, maskSize)
    %does the + shape instead of a square
    CENTER = ceil(maskSize/2);
    vals = zeros(2 * maskSize - 1, 1);
    for maskX = 1:maskSize
        offsetX = maskX - CENTER;
        pxVal = pxInBounds(img, x + offsetX, y, color);
        vals(maskX) = pxVal;
    end
    
    for maskY = 1:maskSize
        offsetY = maskY - CENTER;
        pxVal = pxInBounds(img, x, y + offsetY, color);
        if maskY < CENTER
            vals(maskSize + maskY) = pxVal;
        elseif maskY > CENTER
            vals(maskSize + maskY - 1) = pxVal;
        end
    end
    
    %disp(vals);
    %disp(median(vals));
    newVal = func(vals);
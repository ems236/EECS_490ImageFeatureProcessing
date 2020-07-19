function imgCopy=applyNonlinearFilter(img, func, maskSize)
    [width, height, cols] = size(img);
    
    imgCopy = img;
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                imgCopy(x, y, color) = nonlinearVal(img, x, y, color, func, maskSize);
            end
        end
    end
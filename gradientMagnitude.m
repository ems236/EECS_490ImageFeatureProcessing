function outImg=gradientMagnitude(xDerivative, yDerivative)
    [width, height, cols] = size(xDerivative);
    
    outImg = xDerivative;
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                outImg(x, y, color) = (xDerivative(x, y, color) ^ 2 + yDerivative(x, y, color) ^ 2) ^ 0.5;
            end
        end
    end
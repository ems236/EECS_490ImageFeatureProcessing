function outImg=applyTransform(img, func)
    [width, height, cols] = size(img);
    
    outImg = uint8(img);
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                outImg(x, y, color) = func(img, x, y);
            end
        end
    end
function outImg=applyPredicate(img, predicate)
    [width, height, cols] = size(img);
    
    outImg = uint8(img);
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                oldVal = img(x, y, color);
                if predicate(oldVal)
                    outImg(x, y, color) = 0;
                else
                    outImg(x, y, color) = 255;
                end
            end
        end
    end
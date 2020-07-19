function max=maxVal(img)
    [width, height, cols] = size(img);
    
    max = 0;
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                if max < img(x, y, color)
                    max = img(x, y, color);
                end
            end
        end
    end
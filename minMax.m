function [min,max]=minMax(img)
    [width, height] = size(img);
   
    min = 255;
    max = 0;
    
    for x = 1:width
        for y = 1:height
            val = img(x, y);
            if val < min
                min = val;
            end
            if val > max
                max = val;
            end
        end
    end
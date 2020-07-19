function imgCopy=contrastLinearScaled(img)
    [width, height] = size(img);
   
    [min, max] = minMax(img);
    
    imgCopy = img;
    for x = 1:width
        for y = 1:height
            val = img(x, y);
            imgCopy(x, y) = uint8((val - min) * (255 / (max - min)));
        end
    end
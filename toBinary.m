function outImg=toBinary(img)
    [width, height] = size(img);
    
    outImg = uint8(img);

    for x = 1:width
        for y = 1:height
            oldVal = img(x, y);
            if oldVal == 0
                outImg(x, y) = 1;
            else
                outImg(x, y) = 0;
            end
        end
    end 
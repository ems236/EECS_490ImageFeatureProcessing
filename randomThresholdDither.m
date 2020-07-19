function outImg=randomThresholdDither(img, randFunc)
    [height, width] = size(img);
    
    outImg = uint8(img);
    for x = 1:width
        for y = 1:height
            oldVal = img(y, x);
            threshold = randFunc();
            if oldVal < threshold
                outImg(y, x) = 0;
            else
                outImg(y, x) = 255;
            end
        end
    end

    
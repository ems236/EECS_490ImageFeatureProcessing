function outBinary=binaryImgForBounds(img, bounds)

    outBinary = img(bounds(1):bounds(2), bounds(3):bounds(4));
    [rows, cols] = size(outBinary);
    for row = 1:rows
        for col = 1:cols
            if outBinary(row, col) == 255
                outBinary(row, col) = 255;
            else
                outBinary(row, col) = 0;
            end
        end
    end
    
    outBinary = uint8(outBinary);
end
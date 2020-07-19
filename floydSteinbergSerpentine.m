function outImg=floydSteinbergSerpentine(img, toneVals)
    rightError = [0 0 0; 0 0 7/16; 3/16 5/16 1/16];
    leftError = [0 0 0; 7/16 0 0; 1/16 5/16 3/16];
    
    [rows, cols] = size(img);
    
    errorImg = double(img);
    outImg = img;
    
    for row = 1:rows
        for current = 1:cols
            errorMat = rightError;
            col = current;
            if mod(row, 2) == 1
                errorMat = leftError;
                col = cols - (current - 1);
            end
            [closest, error] = closestVal(max(0, min(255, errorImg(row, col))), toneVals);
            errorImg = addError(errorImg, row, col, error, errorMat);
            outImg(row, col) = uint8(closest);
        end
    end
end
    
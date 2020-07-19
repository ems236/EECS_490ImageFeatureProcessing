function outImg=bayerMatrixDither(img, bayerExponent)
    bayerMat = bayerMatrixToThreshold(bayerMatrixPowerOf2(bayerExponent));
    gridSize = 2^bayerExponent;
    [rows, cols] = size(img);
    outImg = img;
    for row = 1:rows
        for col = 1:cols
            if img(row, col) > bayerMat(mod(row, gridSize) + 1, mod(col, gridSize) + 1)
                outImg(row, col) = 255;
            else
                outImg(row, col) = 0;
            end
        end
    end
end
    
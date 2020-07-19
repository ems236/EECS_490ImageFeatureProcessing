function outImg=warp(img, inverseFunc)

[rows, cols] = size(img);
outImg = uint8(zeros(rows, cols));

for row = 1:rows
    for col = 1:cols
        [newRow, newCol] = inverseFunc(row, col);
        pxVal = bilinearInterpolate(img, newRow, newCol);
        outImg(row, col) = pxVal;
    end
end

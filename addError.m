function outImg=addError(img, row, col, error, errorMat)
    [rows, cols] = size(img);
    outImg = img;
    for rowOffset = -1:1
        for colOffset = -1:1
            nextRow = row + rowOffset;
            nextCol = col + colOffset;
            
            errorCoeff = errorMat(2 + rowOffset, 2 + colOffset);
            if nextRow <= rows && nextRow > 0 && nextCol <= cols && nextCol > 0
               outImg(nextRow, nextCol) = outImg(nextRow, nextCol) + error * errorCoeff;
            end
        end
    end
end
    
function outPx=bilinearInterpolate(img, row, col)

[rows, cols] = size(img);
if col >= 1 && col <= cols && row >= 1 && row <= rows
    lowCol = floor(col);
    highCol = ceil(col);
    lowRow = floor(row);
    highRow = ceil(row);
    
    if highCol == lowCol
        if highCol == cols
            lowCol = lowCol - 1;
        else
            highCol = highCol + 1;
        end
    end
    
    if highRow == lowRow
        if highRow == rows
            lowRow = lowRow - 1;
        else
            highRow = highRow + 1;
        end
    end
    
    outPx = 0;
    outPx = outPx + (row - lowRow) * (col - lowCol) * img(highRow, highCol);
    outPx = outPx + (highRow - row) * (col - lowCol) * img(lowRow, highCol);
    outPx = outPx + (row - lowRow) * (highCol - col) * img(highRow, lowCol);
    outPx = outPx + (highRow - row) * (highCol - col) * img(lowRow, lowCol);
end

function deviation=windowStddevAt(row, col, img, windowSize)
    [rows, cols] = size(img);
    lowRow = max(1, row - floor((windowSize - 1) / 2));
    highRow = min(rows, row + ceil((windowSize - 1) / 2));
    
    lowCol = max(1, col - floor((windowSize - 1) / 2));
    highCol = min(cols, col + ceil((windowSize - 1) / 2));
    
    toTest = zeros((highRow - lowRow + 1) * (highCol - lowCol + 1), 1);
    for r = lowRow:highRow
        for c = lowCol:highCol
            
            toTest((r - lowRow) * (highCol - lowCol) + 1 + c - lowCol) = img(r, c);
        end
    end
    
    deviation = std(toTest);
    
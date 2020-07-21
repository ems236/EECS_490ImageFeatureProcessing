function outVal=stddev(img)
    [rows, cols] = size(img);
    
    pxVec = zeros(1, rows * cols);
    for row = 1:rows
        for col = 1:cols
            pxVec((row - 1) * cols + col) = img(row, col);
        end
    end
    
    outVal = std(pxVec);
    
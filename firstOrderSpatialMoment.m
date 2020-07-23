function [rowMoment, colMoment]=firstOrderSpatialMoment(img)
    [rows, cols] = size(img);
    
    rowSum = 0;
    colSum = 0;
    for row = 1:rows
        for col = 1:cols
            rowSum = rowSum + ((row + 0.5) * img(row, col));
            colSum = colSum + ((col + 0.5) * img(row, col)); 
        end
    end
    
    rowMoment = (1/rows) * rowSum;
    colMoment = (1/cols) * colSum;
end
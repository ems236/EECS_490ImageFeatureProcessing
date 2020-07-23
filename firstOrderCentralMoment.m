function [rowMoment, colMoment]=firstOrderCentralMoment(img)
    [rows, cols] = size(img);
    
    rowSum = 0;
    colSum = 0;
    sum = 0;
    for row = 1:rows
        for col = 1:cols
            rowSum = rowSum + ((double(row) + 0.5) * double(img(row, col)));
            colSum = colSum + ((double(col) + 0.5) * double(img(row, col)));
            sum = sum + img(row, col);
        end
    end
    
    rowCenter = rowSum / double(sum);
    colCenter = colSum / double(sum);
    
    %disp(rowCenter + " " + colCenter);
    
    rowSum = 0.0;
    colSum = 0.0;
    for row = 1:rows
        for col = 1:cols
            rowSum = rowSum + ((double(row) + 0.5 - rowCenter) * double(img(row, col)));
            colSum = colSum + ((double(col) + 0.5 - colCenter) * double(img(row, col)));
        end
    end
    
    rowMoment = rowSum / double(rows);
    colMoment = colSum / double(cols);
end
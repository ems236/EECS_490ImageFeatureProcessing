function [rowMoment, colMoment]=thirdOrderCentralMoments(img)
    [rows, cols] = size(img);
    
    rowSum = 0;
    colSum = 0;
    sum = 0.0;
    for row = 1:rows
        for col = 1:cols
            rowSum = rowSum + ((double(row) + 0.5) * double(img(row, col)));
            colSum = colSum + ((double(col) + 0.5) * double(img(row, col)));
            sum = sum + double(img(row, col));
        end
    end
    
    rowCenter = rowSum / double(sum);
    colCenter = colSum / double(sum);
    disp([rows, cols]);
    
    %disp(rowCenter + " " + colCenter);
    
    rowSum = 0.0;
    colSum = 0.0;
    for row = 1:rows
        for col = 1:cols
            rowDiff = double(row) + 0.5 - rowCenter;
            toAdd = rowDiff^3 * double(img(row, col));
            rowSum = rowSum + toAdd;
            
            colDiff = double(col) + 0.5 - colCenter;
            toAdd = colDiff^3 * double(img(row, col));
            colSum = colSum + toAdd;
        end
    end
    
    rowMoment = rowSum / double(rows)^3;
    colMoment = colSum / double(cols)^3;
end
function [symmetryX, symmetryY, leftRight]=symmetryOf(img)
    [rows, cols] = size(img);
    
    symmetryX = 0;
    symmetryY = 0;
    leftCount = 0;
    rightCount = 0;
    for row = 1:rows
        for col = 1:cols
            if img(row, col) ~= img(row, cols + 1 - col)
                symmetryX = symmetryX + 1;
            end
            if img(row, col) ~= img(rows + 1 - row, col)
                symmetryY = symmetryY + 1;
            end
            
            if col < cols / 2
                leftCount = leftCount + 1;
            else
                rightCount = rightCount + 1;
            end
        end
    end
    
    leftRight = leftCount / rightCount;
end
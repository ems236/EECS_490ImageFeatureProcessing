function bounds=hullBoundsFor(img, componentNum)
    [rows, cols] = size(img);
    
    minRow = rows + 1;
    maxRow = 0;
    
    minCol = cols + 1;
    maxCol = 0;
    for row = 1:rows
        for col = 1:cols
            if img(row, col) == componentNum
                if row < minRow
                    minRow = row;
                end
                if row > maxRow
                    maxRow = row;
                end
                if col < minCol
                    minCol = col;
                end
                if col > maxCol
                    maxCol = col;
                end
            end
        end
    end
    bounds = [max(1, minRow - 1), min(rows, maxRow  + 1), max(1, minCol - 1), min(cols, maxCol + 1)];
end
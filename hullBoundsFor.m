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
    bounds = [minRow, maxRow, minCol, maxCol];
end
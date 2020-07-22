function hulls=convexHullsFor(img)
    characters = blackConnectedComponents(img);
    [rows, cols] = size(img);
   
    visited = zeros(maxVal(characters),1);
    
    hullNum = 1;
    for row = 1:rows
        for col = 1:cols
            if characters(row, col) > 1 && visited(characters(row, col)) == 0
                hulls(hullNum, :) = hullBoundsFor(characters, characters(row, col));
                hullNum = hullNum + 1;
                visited(characters(row, col)) = 1;
            end
        end
    end
end
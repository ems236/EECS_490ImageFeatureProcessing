function deficiancy=convexDeficiencyOf(img)
    [rows, cols] = size(img);
    
    components = connectedComponents(img);
    %img(1,1) guaranteed to be part of hull because a border gets added
    deficiancyNum = components(1, 1);
    
    deficiancy = 0;
    for row = 1:rows
        for col = 1:cols
            if components(row, col) == deficiancyNum
                deficiancy = deficiancy + 1;
            end
        end
    end
end
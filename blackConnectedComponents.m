function components=blackConnectedComponents(img)
    components = connectedComponents(img);
    [rows, cols] = size(img);
    for row = 1:rows
        for col = 1:cols
            %connectedComponents never makes something 0
            if img(row, col) == 255
                components(row, col) = 0;
            end
        end
    end
end
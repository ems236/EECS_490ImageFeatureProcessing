function count=quadCountof(img, quads)
    [rows, cols] = size(img);
    [~, ~, quadCount] = size(quads);
    
    count = 0;
    for quad = 1:quadCount
        currentQuad = quads(:, :, quad);
        for row = 1:(rows - 1)
            for col = 1:(cols - 1)
                if img(row, col) == currentQuad(1, 1) && img(row + 1, col) == currentQuad(2, 1) && img(row, col + 1) == currentQuad(1, 2) && img(row + 1, col + 1) == currentQuad(2, 2)
                    count = count + 1;
                end
            end
        end
    end
end
function hist=histFor(img, dim)
    [width, height, ~] = size(img);
    
    hist = zeros(256, dim);
    for x = 1:width
        for y = 1:height
            for color = 1:dim
                % 1 indexing is dumb
                val = img(x, y, color) + 1; 
                hist(val, color) = hist(val, color) + 1;
            end
        end
    end
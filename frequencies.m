function frequency=frequencies(img)
    [rows, cols] = size(img);
    
    max = 0;
    for row = 1:rows
        for col = 1:cols
            if img(row, col) > max
                max = img(row, col);
            end
        end
    end
    
    frequency = zeros(1, max);
    for row = 1:rows
        for col = 1:cols
            frequency(img(row, col)) = frequency(img(row, col)) + 1;
        end
    end
    
   
              
            
    
    
    
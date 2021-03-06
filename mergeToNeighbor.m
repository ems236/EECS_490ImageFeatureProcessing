function outImg=mergeToNeighbor(img, fromComponent)
    [rows, cols] = size(img);
    outImg = img;
    
    toComponent= -1;
    for row = 1:rows
        for col = 1:cols
            if toComponent < 0 && img(row, col) == fromComponent
                topDiff = row ~= 1 && img(row - 1, col) ~= img(row, col);
                leftDiff = col ~= 1 && img(row, col - 1) ~= img(row, col);
                
                if topDiff 
                    toComponent = img(row - 1, col);
                elseif leftDiff 
                    toComponent = img(row, col - 1);
                end
            end
        end
    end
    
    for row = 1:rows
        for col = 1:cols
            if img(row, col) == fromComponent
                outImg(row, col) = toComponent;
            end
        end
    end
    
    
              
            
    
    
    
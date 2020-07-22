function outImg=connectedComponents(img)
    [rows, cols] = size(img);
    outImg = zeros(rows, cols);
    
    componentNum = 1;
    for row = 1:rows
        for col = 1:cols
            matchesTop = row ~= 1 && img(row - 1, col) == img(row, col);
            matchesLeft = col ~= 1 && img(row, col - 1) == img(row, col);
            if matchesTop && matchesLeft
                if outImg(row - 1, col) ~= outImg(row, col - 1)
                   %the two classes are equivalent and need to be merged
                   topVal = outImg(row - 1, col);
                   leftVal = outImg(row, col - 1);
                   fromClass = max(topVal, leftVal);
                   toClass = min(topVal, leftVal);
                   for r = 1:row
                       for c = 1:cols
                           if outImg(r, c) == fromClass
                               outImg(r, c) = toClass;
                           end
                       end
                   end
                end
                outImg(row, col) = outImg(row - 1, col);
            elseif matchesTop
                outImg(row, col) = outImg(row - 1, col);
            elseif matchesLeft
                outImg(row, col) = outImg(row, col - 1);
            else
                componentNum = componentNum + 1;
                outImg(row, col) = componentNum;
            end
        end
    end
              
            
    
    
    
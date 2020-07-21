function outComponents=largestComponents(srcImg, connectedComponents, colorVals, frequencyList)
    [rows, cols] = size(srcImg);
    [~, compCount] = size(colorVals);
    
    colorIdx = [];
    for i=1:compCount
        colorIdx(colorVals(i) + 1) = i;
    end
    
    outComponents = zeros(1, compCount);
    
    for row = 1:rows
        for col = 1:cols
            compNum = connectedComponents(row, col);
            color = colorIdx(double(srcImg(row, col)) + 1);
            if outComponents(color) == 0 || frequencyList(compNum) > frequencyList(outComponents(color))
                outComponents(color) = compNum;
            end
        end
    end
   
              
            
    
    
    
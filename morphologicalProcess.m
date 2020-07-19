function outImg=morphologicalProcess(img, conditionalLookup, inhibitorLookup)
    binary = toBinary(img);
    %disp(binary);
    [height, width] = size(img);
    
    outImg = binary;
    shouldContinue = true;
    while shouldContinue
        shouldContinue = false;
        marked = zeros(height, width);
        for x = 1:width
            for y = 1:height
                if hitOrMiss(outImg, x, y, conditionalLookup)
                    marked(y, x) = 1;
                else
                    marked(y, x) = 0;
                end
                %if x == 5 && y == 3
                %    hitOrMiss(outImg, x, y, conditionalLookup);
                %    stackPx(outImg, x, y);
                %end
            end
        end
        %disp(uint8(marked(10:20, 5:15)));
        for x = 1:width
            for y = 1:height
                if marked(y, x) == 1 && ~hitOrMiss(marked, x, y, inhibitorLookup)
                    outImg(y, x) = 0;
                    shouldContinue = true;
                end
            end
        end
        %disp(outImg(10:20, 5:15));
        %imshow(fromBinary(outImg));
    end
    
    outImg = fromBinary(outImg);
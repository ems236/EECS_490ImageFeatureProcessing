function edgeMap=laplaceEdgeMap(img, thresholdRatio)
    laplaceVal = laplacian3x3(img);
    %imshow(laplaceVal);
    [width, height] = size(img);
    edgeMap = img;
    for x = 1:width
        for y = 1:height
            edgeMap(x, y) = zeroCrossPositive(laplaceVal, x, y);
        end
    end
    
    threshold = thresholdRatio * maxVal(edgeMap);
    edgeMap = uint8(applyPredicate(edgeMap, @(px) (px >= threshold)));


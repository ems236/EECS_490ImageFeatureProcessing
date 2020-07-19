function edgeMap=sobelEdgeMap(img, horizontalFunc, verticalFunc, thresholdRatio)
    xGrad = horizontalFunc(img);
    yGrad = verticalFunc(img);
    gradientNorm = gradientMagnitude(xGrad, yGrad);
    %imshow(uint8(gradientNorm));
    threshold = thresholdRatio * maxVal(gradientNorm);
    edgeMap = applyPredicate(gradientNorm, @(px) (px >= threshold));

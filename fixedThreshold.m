function outImg=fixedThreshold(img, threshold)
    outImg = applyPredicate(img, @(px)(px < threshold));
    
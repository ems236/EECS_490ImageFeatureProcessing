function features=ocrFeaturesForHull(img)

    features = OcrFeatures;
    
    [rows, cols] = size(img);
    
    features.aspectRatio = max(double(rows), double(cols)) / min(double(rows), double(cols));
    [features.area, features.perimeter, features.eulerNum] = graysAlg(img);
    
    features.circularity = 4* pi * features.area / (features.perimeter * features.perimeter);
    
    [features.spatialMomentRow, features.spatialMomentCol] = firstOrderSpatialMoment(img);
    
    [features.symmetryX, features.symmetryY, features.leftRightRatio] = symmetryOf(img);
    features.symmetryX = features.symmetryX / features.area;
    features.symmetryY = features.symmetryY / features.area;
    
    
end
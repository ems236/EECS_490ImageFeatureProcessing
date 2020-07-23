function features=ocrFeaturesForHull(img)

    features = OcrFeatures;
    
    [rows, cols] = size(img);
    
    features.aspectRatio = double(rows) / double(cols);
    [features.ares, features.perimeter, features.eulerNum] = graysAlg(img);
    
end
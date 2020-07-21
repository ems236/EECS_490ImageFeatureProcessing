function outImg=clusterTextures(img, segmentColors)
    lawsVals = lawsFiltered(img);
    
    energyImgs = lawsVals;
    for i = 1:9
       energyImgs(:,:,i) = windowStddev(lawsVals(:, :, i), Constants.TX_WINDOW_SIZE); 
    end
    
    [rows, cols] = size(img);
    featureVectors = zeros(rows * cols, 9);
    
    for row = 1:rows
        for col = 1:cols
            for i = 1:9
                featureVectors((row - 1) * cols + col, i) = energyImgs(row, col, i);
            end
        end
    end
    
    %matlab really sucks at anything that's not a matrix
    [~, clusters] = size(segmentColors);
    classes = kmeans(featureVectors, clusters);
    
    clustered = zeros(rows, cols);
    for row = 1:rows
        for col = 1:cols
            clustered(row, col) = segmentColors(1, classes((row - 1) * cols + col));
        end
    end
    
    outImg = uint8(clustered);
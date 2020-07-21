function classes=classifyLawsSmallTextures(imgArray, clusters)
    [~, ~, imgs] = size(imgArray);
    featureVecs = zeros(imgs, 9);
    
    for i = 1:imgs
        energies = energyVector(imgArray(:,:,i));
        for j = 1:9
            featureVecs(i, j) = energies(j);
        end
    end
    
    disp(featureVecs)
    classes = kmeans(featureVecs, clusters);
    
    
function outImg=segmentTextures(img, segmentColors)
    clustered = clusterTextures(img, segmentColors);
    
    %do some morphological stuff
    segmented = segmentClusters(clustered, segmentColors);
    
    outImg = uint8(segmented);
    
    
            
    
    
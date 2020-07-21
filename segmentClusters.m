function outImg=segmentClusters(clustered, segmentColors)
    [rows, cols] = size(clustered);
    [~, clusters] = size(segmentColors);
    connectedParts = connectedComponents(clustered);
    frequencyList = frequencies(connectedParts);
    keptComponents = largestComponents(clustered, connectedParts, segmentColors, frequencyList);
    segmented = mergeComponents(connectedParts, frequencyList, keptComponents);
    for row = 1:rows
        for col = 1:cols
            for i = 1:clusters
                if segmented(row, col) == keptComponents(i)
                    segmented(row, col) = segmentColors(i);
                end
            end
        end
    end
    
    outImg = uint8(segmented);
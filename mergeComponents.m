function outImg=mergeComponents(img, frequencies, classesToKeep)
    outImg = img;
    
    [~, compCount] = size(classesToKeep);
    
    
    
    [~, maxComponent] = size(frequencies);
    for component = 1:maxComponent
        isKeepset = false;
        %matlab probably has a set class but idk what it is
        for i = 1:compCount
            if classesToKeep(i) == component
                isKeepset = true;
            end
        end
        
        if frequencies(component) > 0 && ~isKeepset
            outImg = mergeToNeighbor(outImg, component);
        end
    end
    
    
              
            
    
    
    
function [area, perimeter, euler]=graysAlg(img)
    
    q1Patterns(:,:,1) = [1, 0; 0, 0];
    q1Patterns(:,:,2) = [0, 1; 0, 0];
    q1Patterns(:,:,3) = [0, 0; 1, 0];
    q1Patterns(:,:,4) = [0, 0; 0, 1];
    
    q2Patterns(:,:,1) = [1, 1; 0, 0];
    q2Patterns(:,:,2) = [0, 1; 0, 1];
    q2Patterns(:,:,3) = [0, 0; 1, 1];
    q2Patterns(:,:,4) = [1, 0; 1, 0];
    
    q3Patterns(:,:,1) = [1, 1; 1, 0];
    q3Patterns(:,:,2) = [0, 1; 1, 1];
    q3Patterns(:,:,3) = [1, 0; 1, 1];
    q3Patterns(:,:,4) = [1, 1; 0, 1];
    
    q4Patterns(:,:,1) = [1, 1; 1, 1];
    
    qdPatterns(:,:,1) = [1, 0; 0, 1];
    qdPatterns(:,:,2) = [0, 1; 1, 0];
    
    q1Count = quadCountof(img, q1Patterns);
    q2Count = quadCountof(img, q2Patterns);
    q3Count = quadCountof(img, q3Patterns);
    q4Count = quadCountof(img, q4Patterns);
    qdCount = quadCountof(img, qdPatterns);
    
    area = (1/4)*(q1Count + 2 * q2Count + 3 * q3Count + 4 * q4Count + 2 * qdCount);
    perimeter = q1Count + q2Count + q3Count + 2 * qdCount;
    euler = (1/4)*(q1Count - q3Count + 2 * qdCount);
end
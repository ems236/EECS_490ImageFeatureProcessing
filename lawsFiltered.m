function lawsVals=lawsFiltered(img)

    [rows, cols] = size(img);
    lawsVals = zeros(rows, cols, 9);
    
    lawsVals(:,:,1) = applyMask(img, [1, 2, 1; 2, 4, 2; 1, 2, 1;], 1/36);
    lawsVals(:,:,2) = applyMask(img, [1, 0, -1; 2, 0, -2; 1, 0, -1;], 1/12);
    lawsVals(:,:,3) = applyMask(img, [-1, 2, -1; -2, 4, -2; -1, 2, -1;], 1/12);
    lawsVals(:,:,4) = applyMask(img, [-1, -2, -1; 0, 0, 0; 1, 2, 1;], 1/12);
    lawsVals(:,:,5) = applyMask(img, [1, 0, -1; 0, 0, 0; -1, 0, 1;], 1/4);
    lawsVals(:,:,6) = applyMask(img, [-1, 2, -1; 0, 0, 0; 1, -2, 1;], 1/4);
    lawsVals(:,:,7) = applyMask(img, [-1, -2, -1; 2, 4, 2; -1, -2, -1;], 1/12);
    lawsVals(:,:,8) = applyMask(img, [-1, 0, 1; 2, 0, -2; -1, 0, 1;], 1/4);
    lawsVals(:,:,9) = applyMask(img, [1, -2, 1; -2, 4, -2; 1, -2, 1;], 1/4);
    
   
    
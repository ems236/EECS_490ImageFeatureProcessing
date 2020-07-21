function outVec=energyVector(img)
    lawsVals = lawsFiltered(img);
    outVec = zeros(9, 1);
    for i = 1:9
       outVec(i) = stddev(lawsVals(:, :, i));
    end
    
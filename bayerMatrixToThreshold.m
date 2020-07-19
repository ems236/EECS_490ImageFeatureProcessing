function outMat=bayerMatrixToThreshold(bayerMat)
    [rows, cols] = size(bayerMat);
    nSquare = rows * rows;
    outMat = bayerMat;
    for row = 1:rows
        for col = 1:cols
            outMat(row, col) = 255 * (double(bayerMat(row, col)) + 0.5) / nSquare;  
        end
    end
end
    
function outMat=matrixMult(A, B)
[aRows, aCols] = size(A);
[bRows, bCols] = size(B);

%I'm not allowed to use matlab's built in matrix multiplication
if aCols == bRows
    outMat = zeros(aRows, bCols);
    for i = 1:aRows
        for j = 1:bCols
            sum = 0;
            for k = 1:aCols
                sum = sum + (A(i, k) * B(k, j));
            end
            outMat(i, j) = sum;
        end
    end
else
    error("bad dimensions");
end


function outMat=bayerMatrixPowerOf2(power)
    if power == 1
        outMat = [1 2; 3 0;];
    else
        lastMat = bayerMatrixPowerOf2(power - 1);
        outMat = zeros(2^power);

        setBayerVals(0, 0, 1);
        setBayerVals(2^(power-1), 0, 3);
        setBayerVals(0, 2^(power-1), 2);
        setBayerVals(2^(power-1), 2^(power-1), 0);
        
    end    
    function []=setBayerVals(startRow, startCol, toAdd)
        for row = 1:2^(power - 1)
            for col = 1:2^(power - 1)
                outMat(startRow + row, startCol + col) = 4 * lastMat(row, col) + toAdd();
            end
        end
    end
end
    
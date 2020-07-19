function outImg=applyGeometryEffect(img, s, theta, m, t)

[rows, cols] = size(img);
outImg = uint8(zeros(rows, cols));

%want center of img at 0,0
toGeometricCoords = [1, 0, -(double(cols) + 1) / 2;
                       0, -1, (double(rows) + 1) / 2;
                       0, 0, 1];
toImgCoords = [1, 0, (double(cols) + 1) / 2;
                       0, -1, (double(rows) + 1) / 2;
                       0, 0, 1];

inverseEffect = inverseCompoundEffect(s, theta, m, t);
inversedGeometric = matrixMult(inverseEffect, toGeometricCoords);
inverseMat = matrixMult(toImgCoords, inversedGeometric);
%inverseMat = matrixMult(toImgCoords, matrixMult(inverseCompoundEffect(s, theta, m, t), toGeometricCoords))

for row = 1:rows
    for col = 1:cols
        imgCoords = matrixMult(inverseMat, [col; row; 1]);
        pxVal = bilinearInterpolate(img, imgCoords(2), imgCoords(1));
        outImg(row, col) = pxVal;
    end
end

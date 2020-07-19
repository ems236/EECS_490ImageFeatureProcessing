function outImg=applyGeometryEffect(img, s, theta, m, t)

[rows, cols] = size(img);
outImg = zeros(rows, cols);

%want center of img at 0,0
toGeometricCoords = [0, 0, -(double(cols) + 1) / 2;
                       0, 0, (double(rows) + 1) / 2;
                       0, 0, 1];
toImgCoords = [0, 0, (double(cols) + 1) / 2;
                       0, 0, -(double(rows) + 1) / 2;
                       0, 0, 1];

inverseMat = matrixMult(toImgCoords, matrixMult(inverseCompoundEffect(s, theta, m, t), toGeometricCoords));

for row = 1:rows
    for col = 1:cols
        imgCoords = matrixMult(inverseMat, [col; row; 1]);
        outImg(row, col) = bilinearInterpolate(img, imgCoords(2), imgCoords(1));
    end
end

function outImg=fromDisk(img)

[rows, cols] = size(img);
%it better be square

outImg = warp(img, inverseSquare(double(rows + 1) / 2));

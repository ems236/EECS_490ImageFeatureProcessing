function outImg=toDisk(img)

[rows, cols] = size(img);
%it better be square

outImg = warp(img, inverseDisk(double(rows + 1) / 2));

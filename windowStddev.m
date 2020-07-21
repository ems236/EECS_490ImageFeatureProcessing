function outImg=windowStddev(img, windowSize)
    [rows, cols] = size(img);
    outImg = zeros(rows, cols);
    for row = 1:rows
        for col = 1:cols
            outImg(row, col) = windowStddevAt(row, col, img, windowSize);
        end
    end
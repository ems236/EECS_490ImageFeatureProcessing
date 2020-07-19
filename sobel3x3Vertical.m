function outImg=sobel3x3Vertical(img)
    kernel = [-1, -2, -1;
              0, 0, 0;
              1, 2, 1];
    outImg = applyMask(double(img), kernel, 1/8);
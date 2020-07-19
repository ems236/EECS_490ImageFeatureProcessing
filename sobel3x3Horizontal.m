function outImg=sobel3x3Horizontal(img)
    kernel = [1, 0, -1;
              2, 0, -2;
              1, 0, -1];
    outImg = applyMask(double(img), kernel, 1/8);
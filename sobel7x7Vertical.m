function outImg=sobel7x7Vertical(img)
    kernel = [-1, -1, -1, -2, -1, -1, -1;
              -1, -1, -1, -2, -1, -1, -1;
              -1, -1, -1, -2, -1, -1, -1;
              0, 0, 0, 0, 0, 0, 0;
              1, 1, 1, 2, 1, 1, 1;
              1, 1, 1, 2, 1, 1, 1;
              1, 1, 1, 2, 1, 1, 1];
    outImg = applyMask(double(img), kernel, 1/24);
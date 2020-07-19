function outImg=sobel7x7Horizontal(img)
    kernel = [1, 1, 1, 0, -1, -1, -1;
              1, 1, 1, 0, -1, -1, -1;
              1, 1, 1, 0, -1, -1, -1;
              2, 2, 2, 0, -2, -2, -2;
              1, 1, 1, 0, -1, -1, -1;
              1, 1, 1, 0, -1, -1, -1;
              1, 1, 1, 0, -1, -1, -1;];
    outImg = applyMask(double(img), kernel, 1/24);
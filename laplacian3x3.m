function outImg=laplacian3x3(img)
    kernel = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
    outImg = applyMask(double(img), kernel, 1/8);
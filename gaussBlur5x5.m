function outImg=gaussBlur5x5(img)
    kernel = [1, 4, 6, 4, 1; 4, 16, 24, 16, 4; 6, 24, 36, 24, 6; 4, 16, 24, 16, 4; 1, 4, 6, 4, 1];
    outImg = uint8(applyMask(img, kernel, 1/256));
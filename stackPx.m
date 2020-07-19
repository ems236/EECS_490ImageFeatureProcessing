function outVal=stackPx(img, x, y)
    outVal = 0;

    pxVal = readPxZeroOutOfBounds(img, x - 1, y - 1);
    outVal = outVal + pxVal * 2^(8);
    
    pxVal = readPxZeroOutOfBounds(img, x, y - 1);
    outVal = outVal + pxVal * 2^(7);
    
    pxVal = readPxZeroOutOfBounds(img, x + 1, y - 1);
    outVal = outVal + pxVal * 2^(6);
    
    pxVal = readPxZeroOutOfBounds(img, x - 1, y);
    outVal = outVal + pxVal * 2^(5);
    
    pxVal = readPxZeroOutOfBounds(img, x, y);
    outVal = outVal + pxVal * 2^(4);
    
    pxVal = readPxZeroOutOfBounds(img, x + 1, y);
    outVal = outVal + pxVal * 2^(3);
    
    pxVal = readPxZeroOutOfBounds(img, x - 1, y + 1);
    outVal = outVal + pxVal * 2^(2);
    
    pxVal = readPxZeroOutOfBounds(img, x, y + 1);
    outVal = outVal + pxVal * 2^(1);
    
    pxVal = readPxZeroOutOfBounds(img, x + 1, y + 1);
    outVal = outVal + pxVal * 2^(0);
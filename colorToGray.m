function grayVal=colorToGray(px)
    [r, g, b] = unpackColorPx(px);
    grayVal = uint8((0.299 * r) + (0.587 * g) + (0.114 * b));
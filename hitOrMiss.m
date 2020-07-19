function isHit=hitOrMiss(img, x, y, lookupTable)
    isHit = lookupTable(stackPx(img, x, y) + 1);
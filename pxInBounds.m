function val=pxInBounds(img, x, y, color)
    [width, height, ~] = size(img);
   
    xVal = min(width, max(x, 1));
    
    yVal = min(height, max(y, 1));
    
    val = img(xVal, yVal, color);
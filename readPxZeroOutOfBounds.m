function val=readPxZeroOutOfBounds(img, x, y)
    [height, width] = size(img);
   
    if x < 1 || x > width
        val = 0;
    elseif y < 1 || y > height
        val = 0;
    else 
        val = img(y, x);
    end
    
    val = uint16(val);
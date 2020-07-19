function newVal=applyMaskToPx(img, x, y, color, mask, coefficient)
    %always assume these are odd 
    %but don't have to assume they're square
    [maskWidth, maskHeight] = size(mask);
    maskCenterX = ceil(maskWidth / 2);
    maskCenterY = ceil(maskHeight / 2);
 
    sum = 0.0;
    for maskX = 1:maskWidth
       for maskY = 1:maskHeight
            offsetX = maskX - maskCenterX;
            offsetY = maskY - maskCenterY;
            pxVal = pxInBounds(img, x + offsetX, y + offsetY, color);
            
            %disp(pxVal);
            
            sum = sum + (double(pxVal) * mask(maskX, maskY));
            %disp(sum);
       end
    end
    
    newVal = sum * coefficient;
    %disp(newVal);
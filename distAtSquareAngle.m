function dist=distAtSquareAngle(t, halfSide)
    if abs(cos(t)) >= 1 / sqrt(2)
        dist = halfSide / abs(cos(t));
    else
        dist = halfSide / abs(sin(t));
    end
end
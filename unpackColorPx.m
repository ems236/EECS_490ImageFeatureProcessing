function [r,g,b]=unpackColorPx(px)
    r = px(1, 1, 1);
    g = px(1, 1, 2);
    b = px(1, 1, 3);
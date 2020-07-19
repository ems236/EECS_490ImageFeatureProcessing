function outFunc=inverseSquare(CENTER)

function [outRow, outCol]=inverseFunc(row, col)
    xCoord = col - CENTER;
    yCoord = CENTER- row;

    %to polar 
    % r = sqrt(x^2 + y^2)
    % r gets scaled between 0 and center(disk radius) to adjust for square garbage
    % theta = atan2(y, x)

    theta = atan2(yCoord, xCoord);
    r = CENTER * sqrt(xCoord^2 + yCoord^2) / distAtSquareAngle(theta, CENTER);

    %polar to nonpolar coords
    % x = rcos theta
    % y = rsin theta

    outY = r * sin(theta);
    outX = r * cos(theta);

    outRow = -outY + CENTER;
    outCol = outX + CENTER;

end

outFunc = @inverseFunc;
end
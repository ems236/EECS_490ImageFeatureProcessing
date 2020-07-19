function outFunc=inverseDisk(CENTER)

function [outRow, outCol]=inverseFunc(row, col)
xCoord = col - CENTER;
yCoord = CENTER- row;

%to polar 
% r = sqrt(x^2 + y^2)
% theta = atan2(y, x)

r = sqrt(xCoord^2 + yCoord^2);
theta = atan2(yCoord, xCoord);

%polar to nonpolar coords
% x = rcos theta
% y = rsin theta
% where r is now r scaled to a square

distFromSquareCenter = (r / CENTER) * distAtSquareAngle(theta, CENTER);
outY = distFromSquareCenter * sin(theta);
outX = distFromSquareCenter * cos(theta);

outRow = -outY + CENTER;
outCol = outX + CENTER;
end

outFunc = @inverseFunc;
end

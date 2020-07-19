function outMat=inverseRotation(theta)

% forward is 
% [cos(t) -sin(t) 0]
% [sin(t) cos(t) 0]
% [0      0      1]
%
% backward is 
% [cos(t) sin(t) 0]
% [-sin(t) cos(t) 0]
% [0      0      1]
outMat = [cos(theta), sin(theta), 0; 
          -sin(theta), cos(theta), 0; 
          0, 0, 1;];



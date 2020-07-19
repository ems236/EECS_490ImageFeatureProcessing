function outMat=inverseCompoundEffect(s, theta, m, t)

scaleMat = inverseScale(1 - (0.01 * s * t));
rotationMat = inverseRotation(deg2rad(theta * t));
translationMat = inverseTranslation(m * t, -m * t);

% forward = rotate, scale, translate
% inverse = translate, scale, rotate
%         = rotate*scale*translate*p
outMat = matrixMult(rotationMat, matrixMult(scaleMat, translationMat));
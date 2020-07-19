function outMat=inverseCompundEffect(s, theta, m, t)

scaleMat = inverseScale(s * t);
rotationMat = inverseRotation(theta * t);
translationMat = inverseTranslation(m * t, -1 * m * t);

% forward = rotate, scale, translate
% inverse = translate, scale, rotate
%         = rotate*scale*translate*p
outMat = matrixMult(rotationMat, matrixMult(scaleMat, translationMat));
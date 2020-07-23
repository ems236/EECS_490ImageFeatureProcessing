function charPairs=ocrSegmentAndClassify(img, ocrClasses)
    hullBounds = convexHullsFor(img);
    [hulls, ~] = size(hullBounds);
    for i = 1:hulls
        convexHull = binaryImgForBounds(test1, hullBounds(i, :));
        hullPair = RecognizedCharacterClass;
        hullPair.convexHull = convexHull;
        hullPair.classImg = ocrClassify(convexHull, ocrClasses);
        charPairs(i) = hullPair;
    end
end
function charPairs=ocrSegmentAndClassify(img, ocrClasses)
    hullBounds = convexHullsFor(img);
    [hulls, ~] = size(hullBounds);
    for i = 1:hulls
        convexHull = binaryImgForBounds(img, hullBounds(i, :));
        hullPair = RecognizedCharacterClass;
        hullPair.convexHull = convexHull;
        [hullPair.classImg, hullPair.textName] = ocrClassify(convexHull, ocrClasses);
        charPairs(i) = hullPair;
    end
end
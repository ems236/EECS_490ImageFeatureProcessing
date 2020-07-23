function builtClasses=buildOcrClasses(training)
    builtClasses = OcrClasses;

    hullBounds = convexHullsFor(training);
    
    %95126037*48.
    builtClasses.nine = fromBinary(binaryImgForBounds(training, hullBounds(1, :)));
    builtClasses.five = fromBinary(binaryImgForBounds(training, hullBounds(2, :)));
    builtClasses.one = fromBinary(binaryImgForBounds(training, hullBounds(3, :)));
    builtClasses.two = fromBinary(binaryImgForBounds(training, hullBounds(4, :)));
    builtClasses.six = fromBinary(binaryImgForBounds(training, hullBounds(5, :)));
    builtClasses.zero = fromBinary(binaryImgForBounds(training, hullBounds(6, :)));
    builtClasses.three = fromBinary(binaryImgForBounds(training, hullBounds(7, :)));
    builtClasses.seven = fromBinary(binaryImgForBounds(training, hullBounds(8, :)));
    builtClasses.star = fromBinary(binaryImgForBounds(training, hullBounds(9, :)));
    builtClasses.four = fromBinary(binaryImgForBounds(training, hullBounds(10, :)));
    builtClasses.eight = fromBinary(binaryImgForBounds(training, hullBounds(11, :)));
    builtClasses.dot = fromBinary(binaryImgForBounds(training, hullBounds(12, :)));
end
function [classImg, name]=ocrClassify(convexHull, ocrClasses)
    features = ocrFeaturesForHull(convexHull);
    
    %First split on euler number
    if features.eulerNum == -1
        %must be 8
        classImg = ocrClasses.eight;
        name = "eight";
    elseif features.eulerNum == 0
        %pretty confidently 0, 4, 6, 9
        if features.symmetryY / features.symmetryX > 1.3
            %6 or 9
            %pretty much exact same features other than left right moment stuff
            if features.centralMomentRow  > 0.0
                % must be 9
                classImg = ocrClasses.nine;
                name = "nine";
            else
                %must be 6
                classImg = ocrClasses.six;
                name = "six";
            end
        else
            if features.convexDeficiency < 1.0
                %must be 0
                classImg = ocrClasses.zero;
                name = "zero";
            else
                %must be 4
                classImg = ocrClasses.four;
                name = "four";
            end
        end
    else
        %pretty confidently 1, 2, 3, 5, 7, ., *
        %Look at circularity
        if features.circularity > 0.5
            %must be .
            classImg = ocrClasses.dot;
            name = "dot";
        elseif features.circularity > 0.15
            %must be 1 or 7
            % serif 1 is surprisingly circular, so is 7
            if features.centralMomentRow > 2
                % must be 7
                classImg = ocrClasses.seven;
                name = "seven";
            else
                %must be 1
                classImg = ocrClasses.one;
                name = "one";
            end
        else
            %2, 3, 5, *
            %Look at aspect ratio
            if features.aspectRatio < 1.1
                %square hull low circularity means it's a *
                % must be *
                classImg = ocrClasses.star;
                name = "star";
            else
                %2, 3, 5
                if features.symmetryX > features.symmetryY
                    %must be 3
                    %3 is more vertically symmetric than horizontally
                    classImg = ocrClasses.three;
                    name = "three";
                else
                    %2, 5
                    % one norm of symmetry
                    if features.symmetryX + features.symmetryY > 1.9
                        %5 is less symmetrical than 2
                        %must be 5
                        classImg = ocrClasses.five;
                        name = "five";
                    else
                        classImg = ocrClasses.two;
                        name = "two";
                    end
                end
            end
        end
    end
end
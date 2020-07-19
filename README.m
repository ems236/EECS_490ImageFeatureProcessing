% EECS490 Homework Assignment #1
% June 17, 2020
% Name: Ellis Saupe
% NetworkID / email: ems236@case.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instructions: All source images are assumed to be in a folder at the
% relative path provided.  All output images are written to the folder
% provided
% 
%  Arguments: string path to source image directory,
%  string path to output image/plot directory
% NOTE: the output directory must already exist or errors will occur.

%  run readme from the matlab terminal:
%  README '..\srcImages\' '..\outImages\'
%  
%  Note I only tried this in powershell
%  run the readme from terminal / cmd
%  matlab -r "README "..\srcImages\" "..\destImages\""
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1.a.1: Edge Detection a
% Implementation: 3x3 or 7x7 Sobel filter with threshold relative to max gradient
% M-file name: sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-sobel-edge.raw, building-sobel-edge_noise-3.raw  building-sobel-edge_noise-7.raw
function []=README(srcDir, outputDir)
disp("Running sobelEdgeMap...");
f1 = figure;
title("Sobel edge map for building.raw");
building_dark = readraw(srcDir + "building.raw");

edgeMap = sobelEdgeMap(building_dark, @sobel3x3Horizontal, @sobel3x3Vertical, 0.15);
imshow(edgeMap);

writeraw(edgeMap, outputDir + "building-sobel-edge.raw");
disp("writing to " + outputDir + "building-sobel-edge.raw");
saveas(f1, outputDir + "building-sobel-edge.png");

f2 = figure;
title("Sobel edge map for building_noise.raw");
building_noise = readraw(srcDir + "building_noise.raw");
edgeMap = sobelEdgeMap(building_noise, @sobel3x3Horizontal, @sobel3x3Vertical, 0.4);
imshow(edgeMap);

writeraw(edgeMap, outputDir + "building-sobel-edge_noise.raw");
disp("writing to " + outputDir + "building-sobel-edge_noise.raw");
saveas(f2, outputDir + "building-sobel-edge_noise.png");

f3 = figure;
title("Sobel edge map for building_noise.raw");
edgeMap = sobelEdgeMap(building_noise, @sobel7x7Horizontal, @sobel7x7Vertical, 0.2);
imshow(edgeMap);

writeraw(edgeMap, outputDir + "building-sobel-edge_noise-7.raw");
disp("writing to " + outputDir + "building-sobel-edge_noise-7.raw");
saveas(f3, outputDir + "building-sobel-edge_noise-7.png");

% Problem 1.a.2: Edge Detection b
% Implementation: 3x3 Laplacian filter with max difference threshold of 50
% M-file name: laplaceEdgeMap.m
% Usage: new_image = laplaceEdgeMap(img, threshold))
% Output image: building-laplace-edge.raw, building-laplace-edge_noise.raw
disp("Running laplaceEdgeMap...");
f4 = figure;
title("Laplace edge map for building_noise.raw");
edgeMap = laplaceEdgeMap(building_dark, 0.15);
imshow(edgeMap);
writeraw(edgeMap, outputDir + "building-laplace-edge.raw");
disp("writing to " + outputDir + "building-laplace-edge.raw");
saveas(f4, outputDir + "building-laplace-edge.png");

f5 = figure;
title("Laplace edge map for building_noise.raw");
edgeMap = laplaceEdgeMap(building_noise, 0.4);
imshow(edgeMap);
writeraw(edgeMap, outputDir + "building-laplace-edge_noise.raw");
disp("writing to " + outputDir + "building-laplace-edge_noise.raw");
saveas(f5, outputDir + "building-laplace-edge_noise.png");

% Problem 1.b.1: Edge Detection with preprocessing contrast
% Implementation: Histogram Equalization Contrast enhancement followed by same methods as above
% M-file name: constrastLinearScaled.m, sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-contrast.raw, building-contrast-sobel.raw, building-contrast-laplace.raw,
disp("Running sobeleEdgeMap...");
f6 = figure;
title("building with histogram equalization contrast scaling");
building_contrast = contrastHistogramEqualized(building_dark);
imshow(building_contrast);
writeraw(building_contrast, outputDir + "building-contrast.raw");
disp("writing to " + outputDir + "building-contrast.raw");
saveas(f6, outputDir + "building-contrast.png");

f7 = figure;
title("Sobel edge map for building.raw with contrast enhancement");
edgeMap = sobelEdgeMap(building_contrast, @sobel3x3Horizontal, @sobel3x3Vertical, 0.2);
imshow(edgeMap);
name = "building-contrast-sobel";
writeraw(edgeMap, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f7, outputDir + name + ".png");

disp("Running laplaceEdgeMap...");
f8 = figure;
title("Laplace edge map for building.raw with contrast enhancement");
edgeMap = laplaceEdgeMap(building_contrast, 0.25);
imshow(edgeMap);
name = "building-contrast-laplace";
writeraw(edgeMap, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f8, outputDir + name + ".png");


% Problem 1.b.2: Edge Detection with preprocessing noise removal
% Implementation: 5x5 median filter followed by same methods as above
% M-file name: applyMedianFilter.m, sobelEdgeMap.m, laplaceEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-blur.raw, building-blur-sobel.raw, building-blur-laplace.raw,
disp("Running sobelEdgeMap...");
f9 = figure;
title("Median noise removal for building_noise.raw");
building_blur = applyMedianFilter(building_noise, 5);
imshow(building_blur);
name = "building-blur";
writeraw(building_blur, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f9, outputDir + name + ".png");

f10 = figure;
title("Sobel Edge filter for denoised building");
edgeMap = sobelEdgeMap(building_blur, @sobel3x3Horizontal, @sobel3x3Vertical, 0.2);
imshow(edgeMap);
name = "building-blur-sobel";
writeraw(edgeMap, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f10, outputDir + name + ".png");

disp("Running laplaceEdgeMap...");
f11 = figure;
title("Laplace Edge filter for denoised building");
edgeMap = laplaceEdgeMap(building_blur, 0.2);
imshow(edgeMap);
name = "building-blur-laplace";
writeraw(edgeMap, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f11, outputDir + name + ".png");

% Problem 2: Shrinking, Thinning, Skeletonizing
% Implementation: 2 stage 3x3 hit or miss transformations with lookup tables
% M-file name: morphologicalProcess.m, toLookupTable.m
% Usage: new_image = morphologicalProcess(img, conditionalLookupTable, inhibitorLookupTable)
% Output image: pattern-shrink.raw, pattern-thin.raw, pattern-skeleton.raw,
% pcb-shrink.raw, pcb-thin.raw, pcb-skeleton.raw
patterns = readraw(srcDir + "patterns.raw");
pcb = readraw(srcDir + "pcb.raw");

disp("Constructing lookup tables (I'm not sure why this is slow)...");
shrinkConditional = toLookupTable(Constants.SHRINK_CONDITIONAL);
shrinkInhibitor = toLookupTable(Constants.SHRINK_UNCONDITIONAL);

thinConditional = toLookupTable(Constants.THIN_CONDITIONAL);
thinInhibitor = toLookupTable(Constants.THIN_UNCONDITIONAL);

skeletonizeConditional = toLookupTable(Constants.SKELETONIZE_CONDITIONAL);
skeletonizeInhibitor = toLookupTable(Constants.SKELETONIZE_UNCONDITIONAL);

disp("Shrinking patterns...");
f12 = figure;
title("Shrinking patterns");
shrinkPattern = morphologicalProcess(patterns, shrinkConditional, shrinkInhibitor);
imshow(shrinkPattern);
name = "pattern-shrink";
writeraw(shrinkPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f12, outputDir + name + ".png");

disp("Thinning patterns...");
f13 = figure;
title("Thinning patterns");
thinPattern = morphologicalProcess(patterns, thinConditional, thinInhibitor);
imshow(thinPattern);
name = "pattern-thin";
writeraw(thinPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f13, outputDir + name + ".png");

disp("Skeletonizing patterns...");
f14 = figure;
title("Skeletonizing patterns");
skeletonPattern = morphologicalProcess(patterns, skeletonizeConditional, skeletonizeInhibitor);
imshow(skeletonPattern);
name = "pattern-skeletonize";
writeraw(skeletonPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f14, outputDir + name + ".png");

disp("Shrinking pcb...");
f15 = figure;
title("Shrinking pcb");
shrinkPattern = morphologicalProcess(pcb, shrinkConditional, shrinkInhibitor);
imshow(shrinkPattern);
name = "pcb-shrink";
writeraw(shrinkPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f15, outputDir + name + ".png");

disp("Thinning pcb...");
f16 = figure;
title("Thinning pcb");
thinPattern = morphologicalProcess(pcb, thinConditional, thinInhibitor);
imshow(thinPattern);
name = "pcb-thin";
writeraw(thinPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f16, outputDir + name + ".png");

disp("Skeletonizing pcb...");
f17 = figure;
title("Skeletonizing patterns");
skeletonPattern = morphologicalProcess(pcb, skeletonizeConditional, skeletonizeInhibitor);
imshow(skeletonPattern);
name = "pcb-skeletonize";
writeraw(skeletonPattern, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f17, outputDir + name + ".png");


% Problem 3.1: Halftoning with thresholding 
% Implementation: A threshold of 127
% M-file name: fixedThreshold.m
% Usage: bwImg = fixedThreshold(img, 100)
% Output image: barbara-fixed.raw
disp("Thresholding Barbara...");
barbara = readraw(srcDir + "barbara.raw");
f18 = figure;
title("Thresholded Barbara");
bw = fixedThreshold(barbara, 127);
imshow(bw);
name = "barbara-fixed";
writeraw(bw, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f18, outputDir + name + ".png");

% Problem 3.2.1: Halftoning with random dithering
% Implementation: A threshold random uniform noise ranging from 96 to 160 
% M-file name: randomThresholdDither.m
% Usage: bwImg = randomThresholdDither(img, @()(rand() * 64 + 96));
% Output image: barbara-uniform-dither.raw
disp("Uniform Random Dithering Barbara...");
f19 = figure;
title("Thresholded Barbara");
uniformDithered = randomThresholdDither(barbara, @()(rand() * 128 + 64));
imshow(uniformDithered);
name = "barbara-uniform-dither";
writeraw(uniformDithered, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f19, outputDir + name + ".png");

% Problem 3.2.2: Halftoning with random dithering
% Implementation: A threshold of random normal noise with mean of 127 and a stdev of 256/12 (almost all thresholds will be within 64 or 3 std devs of 127)
% M-file name: randomThresholdDither.m
% Usage: bwImg = randomThresholdDither(img, @()(rand() * 64 + 96));
% Output image: barbara-normal-dither.raw
disp("Normal Random Dithering Barbara...");
f20 = figure;
title("Normal Dithered Barbara");
normalDithered = randomThresholdDither(barbara, @()(normrnd(127, 32)));
imshow(normalDithered);
name = "barbara-normal-dither";
writeraw(normalDithered, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f20, outputDir + name + ".png");

% Problem 3.3: Halftoning with Bayer Pattern Matrix
% Implementation: A threshold dependent on a bayer pattern matrix
% M-file name: bayerMatrixDither.m
% Usage: bwImg = bayerMatrixDither(img, 1); %== 2x2 pattern, second argument is log2(pattern size)
% Output image: barbara-bayer2x2-dither.raw, barbara-bayer4x4-dither.raw
disp("Bayer 2x2 Dithering Barbara...");
f21 = figure;
title("Bayer 2x2 Dithering Barbara...");
bayerDither2 = bayerMatrixDither(barbara, 1);
imshow(bayerDither2);
name = "barbara-bayer2x2-dither";
writeraw(bayerDither2, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f21, outputDir + name + ".pdf");
saveas(f21, outputDir + name + ".png");

disp("Bayer 4x4 Dithering Barbara...");
f22 = figure;
title("Bayer 4x4 Dithering Barbara...");
bayerDither4 = bayerMatrixDither(barbara, 2);
imshow(bayerDither4);
name = "barbara-bayer4x4-dither";
writeraw(bayerDither4, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f22, outputDir + name + ".pdf");
saveas(f22, outputDir + name + ".png");

% Problem 3.4: Halftoning with Floyd-Steinberg error diffusion  
% Implementation: Floyd-Steinberg error diffusion with serpentine processing
% M-file name: floySteinbergSerpentine.m
% Usage: bwImg = floySteinbergSerpentine(img, [0; 255])
% Output image: barbara-serpenine.raw
disp("Floyd Steinberg serpentine dithering barbara...");
f23 = figure;
title("Floyd Steinberg serpentine dithering barbara");
serpDither = floydSteinbergSerpentine(barbara, [0; 255]);
imshow(serpDither);
name = "barbara-serpentine";
writeraw(serpDither, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f23, outputDir + name + ".pdf");
saveas(f23, outputDir + name + ".png");

% Problem 3.5: 4-tone transform
% Implementation: Floyd-Steinberg error diffusion with serpentine processing
% M-file name: floydSteinbergSerpentine.m
% Usage: bwImg = floySteinbergSerpentine(img, [0; 255])
% Output image: barbara-histeq.raw barbara-4tone.raw
disp("Floyd Steinberg serpentine dithering barbara...");

f24 = figure;
title("4 Tone barbara");
serpQuarter = floydSteinbergSerpentine(barbara, [0; 85; 170; 255]);
imshow(serpQuarter);
name = "barbara-4tone";
writeraw(serpQuarter, outputDir + name + ".raw");
disp("writing to " + outputDir + name + ".raw");
saveas(f24, outputDir + name + ".pdf");
saveas(f24, outputDir + name + ".png");

end
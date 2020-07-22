% EECS490 Homework Assignment #3
% July 24, 2020
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
% Problem 1.a: Geometric Modification
% Implementation: Inverse Affine Transforms with Bilinear interpolation
% M-file name: sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-sobel-edge.raw, building-sobel-edge_noise-3.raw  building-sobel-edge_noise-7.raw
function []=README(srcDir, outputDir)
disp("Transforming Barabara");
barbara = readraw(srcDir + "barbara.raw");
imshow(barbara);

affectedBarbara = applyGeometryEffect(barbara, 3, 5, 2, 5);
saveImg(affectedBarbara, "geometric-t5", outputDir);

affectedBarbara = applyGeometryEffect(barbara, 3, 5, 2, 20);
saveImg(affectedBarbara, "geometric-t20", outputDir);


% Problem 1.b: Warping
% Implementation: Parametric transforms with bilinear interpolation
% M-file name: sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-sobel-edge.raw, building-sobel-edge_noise-3.raw  building-sobel-edge_noise-7.raw
baboon = readraw(srcDir + "baboon.raw");

diskBaboon = toDisk(baboon);
saveImg(diskBaboon, "diskBaboon", outputDir);

resquaredBaboon = fromDisk(diskBaboon);
saveImg(resquaredBaboon, "squareFromDiskBaboon", outputDir);


% Problem 2.a: Texture Classification
% Implementation: Laws Filters with full image stdev and kmeans
% M-file name: sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-sobel-edge.raw, building-sobel-edge_noise-3.raw  building-sobel-edge_noise-7.raw
txClasses = zeros(64, 64, 15);
for i = 1:15
    txClasses(:, :, i) = readraw(srcDir + "sample" + string(i) + ".raw");
end

classes = classifyLawsSmallTextures(txClasses, 5);
classCount = [1, 1, 1, 1, 1];
for i = 1:15
    classNum = classes(i);
    saveImg(uint8(txClasses(:,:,i)), "textureClass-" + classNum + "-" + classCount(classNum), outputDir);
    classCount(classNum) = classCount(classNum) + 1; 
end

% Problem 2.b: Texture Segmentation
% Implementation: Laws Filters with 24x24 sliding window stdev and kmeans + morphological merging to largest connected components
% M-file name: sobelEdgeMap.m
% Usage: new_image = sobelEdgeMap(img, @sobel3x3Horizontal, @sobal3x3Vertical, threshold (relative to max gradient))
% Output image: building-sobel-edge.raw, building-sobel-edge_noise-3.raw  building-sobel-edge_noise-7.raw
mosaic1 = readraw(srcDir + "comb1.raw");
clustered = clusterTextures(mosaic1, [0, 63, 127, 191, 255]);
segmented = segmentClusters(clustered, [0, 63, 127, 191, 255]);
saveImg(segmented, "segmented1", outputDir);

mosaic2 = readraw(srcDir + "comb2.raw");
clustered = clusterTextures(mosaic2, [0, 85, 170, 255]);
segmented = segmentClusters(clustered, [0, 85, 170, 255]);
saveImg(segmented, "segmented2", outputDir);
end

function []=saveImg(img, imgName, outDir)
    f = figure;
    imshow(img);
    writeraw(img, outDir + imgName + ".raw");
    disp("writing to " + outDir + imgName + ".raw");
    saveas(f, outDir + imgName + ".png");
end
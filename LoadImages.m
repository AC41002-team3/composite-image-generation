function [ imageList ] = LoadImages( imageDirectory )
%LOADIMAGES Provide directory of images,
%           and a structured array shall be returned.
    rawImages = dir(strcat(imageDirectory, '*.jpg'));
    nFiles = length(rawImages);
    for i = 1:nFiles
        currentFileName = rawImages(i).name;
        currentRawImage = imread(currentFileName);
        imageList{i} = currentRawImage;
    end
end


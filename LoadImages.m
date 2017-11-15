function [ imageList ] = LoadImages( imageDirectory )
%LOADIMAGES Provide directory of images,
%           and a structured array shall be returned
    %imageList = zeros(1, 1000000);
    rawImages = dir(strcat(imageDirectory, '*.jpg'));
    nFiles = length(rawImages)
    for i = 1:nFiles
        currentFileName = rawImages(i).name;
        currentRawImage = imread(strcat(imageDirectory,currentFileName));
        imageList{i} = currentRawImage;
    end
end


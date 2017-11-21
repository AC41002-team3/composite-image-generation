function [ imageList ] = LoadImages( imageDirectory )
%LOADIMAGES Provide directory of images,
%           and a structured array shall be returned
    if exist(imageDirectory) == 7
        rawImages = dir(strcat(imageDirectory, '*.jpg'));
        nFiles = length(rawImages);
        for i = 1:nFiles
            currentFileName = rawImages(i).name;
            currentRawImage = imread(strcat(imageDirectory,currentFileName));
            imageList{i} = currentRawImage;
        end
    else
        imageList{1} = imread(imageDirectory);
    end
end


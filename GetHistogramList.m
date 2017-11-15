function [ rawImages ] = GetHistogramList( imageDirectory )
%GETHISTOGRAMLIST Summary of this function goes here
    rawImages = LoadImages('./');
    nImages = length(rawImages);
    for i = 1:nImages
        imshow(rawImages{i});
    end
end


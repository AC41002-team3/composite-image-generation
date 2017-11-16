function [ retArray ] = GetColourHistogram( image )
%GETCOLOURHISTOGRAM get the histogram values for colour image, and the bins
% SOURCE: https://uk.mathworks.com/matlabcentral/answers/181624-how-to-get-color-histogram-of-an-image
    %Split into RGB Channels
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
    %Get histValues for each channel
    yRed = imhist(Red);
    yGreen = imhist(Green);
    yBlue = imhist(Blue);
    yRed = yRed./sum(yRed(:));
    yGreen = yGreen./sum(yGreen(:));
    yBlue = yBlue./sum(yBlue(:));
    retArray = {yRed, yGreen, yBlue};
    %plot([0:255], yRed, 'Red', [0:255], yGreen, 'Green', [0:255], yBlue, 'Blue');
    %probably won't return bins as don't need them,
    %but I'll keep them here for reference rn
    % range array is [0:255]
end


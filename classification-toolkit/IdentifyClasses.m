function [ manmadeHistograms, naturalHistograms ] = IdentifyClasses(trainManmadeDir, trainNaturalDir)
%IDENTIFYCLASSES Summary of this function goes here
%   Detailed explanation goes here
    trainManmadeDir = strcat(trainManmadeDir, '/');
    trainNaturalDir = strcat(trainNaturalDir, '/');
    manmadeHistograms = GetHistogramList(trainManmadeDir);
    naturalHistograms = GetHistogramList(trainNaturalDir);
    %histograms = {manmadeHistograms naturalHistograms};
end


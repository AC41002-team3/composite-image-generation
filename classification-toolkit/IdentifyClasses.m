function [ manmadeHistograms, naturalHistograms ] = IdentifyClasses(trainManmadeDir, trainNaturalDir)
%IDENTIFYCLASSES Summary of this function goes here
%   Detailed explanation goes here
    manmadeHistograms = GetHistogramList(trainManmadeDir);
    naturalHistograms = GetHistogramList(trainNaturalDir);
    %histograms = {manmadeHistograms naturalHistograms};
end


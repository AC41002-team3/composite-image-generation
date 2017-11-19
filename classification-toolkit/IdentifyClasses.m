function [ manmadeHistograms, naturalHistograms ] = IdentifyClasses()
%IDENTIFYCLASSES Summary of this function goes here
%   Detailed explanation goes here
    manmadeHistograms = GetHistogramList('../Assignments/Images/trainimages/manmade/');
    naturalHistograms = GetHistogramList('../Assignments/Images/trainimages/natural/');
    %histograms = {manmadeHistograms naturalHistograms};
end


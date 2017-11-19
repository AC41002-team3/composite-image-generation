function [ manmadeHistograms, naturalHistograms ] = IdentifyClasses()
%IDENTIFYCLASSES Summary of this function goes here
%   Detailed explanation goes here
    manmadeHistograms = GetHistogramList('../Assignments/Images/out_manmade_train_1k/');
    naturalHistograms = GetHistogramList('../Assignments/Images/out_natural_train_1k/');
    %histograms = {manmadeHistograms naturalHistograms};
end


function [ testManmade, testNatural ] = RunTestSet()
%RUNTESTSET Summary of this function goes here
%   Detailed explanation goes here
    testManmade = GetHistogramList('../Assignments/Images/out_manmade_1k_test/out_manmade_1k/');
    testNatural = GetHistogramList('../Assignments/Images/out_natural_1k_test/out_natural_1k/');
end


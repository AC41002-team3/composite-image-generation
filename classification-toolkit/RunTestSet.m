function [ testManmade, testNatural ] = RunTestSet()
%RUNTESTSET Summary of this function goes here
%   Detailed explanation goes here
    testManmade = GetHistogramList('../../Assignments/Images/out_manmade_test_1k/');
    testNatural = GetHistogramList('../../Assignments/Images/out_natural_test_1k/');
end


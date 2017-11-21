function [ testManmade, testNatural ] = RunTestSet(testManmadeDir, testNaturalDir)
%RUNTESTSET Summary of this function goes here
%   Detailed explanation goes here
    testManmadeDir = strcat(testManmadeDir, '/');
    testNaturalDir = strcat(testNaturalDir, '/');
    testManmade = GetHistogramList(testManmadeDir);
    testNatural = GetHistogramList(testNaturalDir);
end


function [ testManmade, testNatural ] = RunTestSet(testManmadeDir, testNaturalDir)
%RUNTESTSET Summary of this function goes here
%   Detailed explanation goes here
    testManmade = GetHistogramList(testManmadeDir);
    testNatural = GetHistogramList(testNaturalDir);
end


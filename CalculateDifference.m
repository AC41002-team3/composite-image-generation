function [ ] = CalculateDifference( )
%CALCULATEDIFFERENCE Summary of this function goes here
%   Detailed explanation goes here
    [trainManmade,trainNatural] = IdentifyClasses(); %hists of training
    [testManmade, testNatural] = RunTestSet(); %hists of manmade
    Test(testManmade, trainManmade, trainNatural);
    %Test(testNatural, trainManmade, trainNatural);
end


function [ ] = CalculateDifference(trainManmadeDir, trainNaturalDir, testManmadeDir, testNaturalDir, k )
%CALCULATEDIFFERENCE Summary of this function goes here
%   Detailed explanation goes here
    [trainManmade,trainNatural] = IdentifyClasses(trainManmadeDir, trainNaturalDir); %hists of training
    [testManmade, testNatural] = RunTestSet(testManmadeDir, testNaturalDir); %hists of manmade
    [manmadeInManmade, manmadeInNatural] = Test(testManmade, trainManmade, trainNatural, k);
    [naturalInManmade, naturalInNatural] = Test(testNatural, trainManmade, trainNatural, k);
    manmadeInManmade
    naturalInNatural
    %Test(testNatural, trainManmade, trainNatural);
end

     
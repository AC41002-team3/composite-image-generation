function [ manmadeInManmade naturalInNatural timeTaken ] = CalculateDifference(trainManmadeDir, trainNaturalDir, testManmadeDir, testNaturalDir, k )
%CALCULATEDIFFERENCE Summary of this function goes here
%   Detailed explanation goes here
    tic
    trainManmadeDir = strcat(trainManmadeDir, '/');
    trainNaturalDir = strcat(trainNaturalDir, '/');
    testManmadeDir = strcat(testManmadeDir, '/');
    testNaturalDir = strcat(testNaturalDir, '/');
    [trainManmade,trainNatural] = IdentifyClasses(trainManmadeDir, trainNaturalDir); %hists of training
    [testManmade, testNatural] = RunTestSet(testManmadeDir, testNaturalDir); %hists of manmade
    [manmadeInManmade, manmadeInNatural] = Test(testManmade, trainManmade, trainNatural, k);
    [naturalInManmade, naturalInNatural] = Test(testNatural, trainManmade, trainNatural, k);
    manmadeInManmade;
    naturalInNatural;
    timeTaken = toc;
    %Test(testNatural, trainManmade, trainNatural);
end

     
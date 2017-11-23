function [ manmadeInManmade naturalInNatural timeTaken ] = CalculateDifference(trainManmadeDir, trainNaturalDir, testManmadeDir, testNaturalDir, k )
%CALCULATEDIFFERENCE Summary of this function goes here
%   Detailed explanation goes here
    tic
    [trainManmade,trainNatural] = IdentifyClasses(trainManmadeDir, trainNaturalDir); %hists of training
    if strcmp(testNaturalDir,'na')
        %testManmadeDir = strcat(testManmadeDir, '/');
        testManmade = GetHistogramList(testManmadeDir);
        [manmadeInManmade, naturalInNatural] = Test(testManmade, trainManmade, trainNatural, k);
    else
        [testManmade, testNatural] = RunTestSet(testManmadeDir, testNaturalDir); %hists of manmade
        [manmadeInManmade, manmadeInNatural] = Test(testManmade, trainManmade, trainNatural, k);
        [naturalInManmade, naturalInNatural] = Test(testNatural, trainManmade, trainNatural, k);
    end
    manmadeInManmade;
    naturalInNatural;
    timeTaken = toc;
    %Test(testNatural, trainManmade, trainNatural);
end

     
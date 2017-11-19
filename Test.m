function [ inManmade, inNatural ] = Test( testHists, trainManmade, trainNatural) %send in, get percentage of each classified
%TEST Summary of this function goes here
%   Detailed explanation goes here
%1 = manmade %2 = natural
    inNatural = 0;
    inManmade = 0;
    compareManmade{1}{1} = 0;
    compareNatural{1}{1} = 0;
    nTestHists = length(testHists);
    nTrainManmade = length(trainManmade);
    nTrainNatural = length(trainNatural);
    manmadeKnnList = zeros(1,nTestHists);
    naturalKnnList = zeros(1,nTestHists);
    for i=1:nTestHists %for each test image
       allDistances = zeros(nTrainManmade,1);
       for j=1:nTrainManmade %for each manmade trainer
           for a=1:3 % for each colour
           compareManmade{i}{a} = ChiSquareDistance(testHists{i}{a}, trainManmade{j}{a});
           %compareManmade{i}{a} = compareManmade{i}{a};
           end
           allDistances(j) = mean([compareManmade{i}{1:3}]);
       end
       manmadeKnnList(i) = allDistances(knnsearch(allDistances, 0));
    end
    for i=1:nTestHists %for each test image
       allDistances = zeros(nTrainNatural,1);
       for j=1:nTrainNatural %for each manmade trainer
           for a=1:3 % for each colour
           compareNatural{i}{a} = ChiSquareDistance(testHists{i}{a}, trainNatural{j}{a});
           %compareNatural{i}{a} = compareNatural{i}{a} * 2;
           end
           allDistances(j) = mean([compareNatural{i}{1:3}]);
       end
       naturalKnnList(i) = allDistances(knnsearch(allDistances, 0));
    end
    for i=1:nTestHists
        if naturalKnnList(i) < manmadeKnnList(i)
            inNatural = inNatural + 1;
        else
            inManmade = inManmade + 1;
    end
end


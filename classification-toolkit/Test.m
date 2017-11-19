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
            sumup = 0;
            compareManmade{i}{a} = ChiSquareDistance(testHists{i}{a}, trainManmade{j}{a});
            %compareManmade{i}{a} = compareManmade{i}{a};
        end
        %allDistances(j) = mean([compareManmade{i}{1:3}]);
        %allDistances(j) = sum(compareManmade{i}{1:3});
        for a=1:3
            sumup = sumup + compareManmade{i}{a};
        end
        allDistances(j) = sumup;
    end
    knnadd = zeros(1,4);
    knnadd = sum(allDistances(knnsearch(allDistances, 0, 'K', 4)));
    manmadeKnnList(i) = knnadd;
    %manmadeKnnList(i) = allDistances(knnsearch(allDistances, 0));
end
for i=1:nTestHists %for each test image
    allDistances = zeros(nTrainNatural,1);
    for j=1:nTrainNatural %for each natural trainer
        sumup = 0;
        for a=1:3 % for each colour
            compareNatural{i}{a} = ChiSquareDistance(testHists{i}{a}, trainNatural{j}{a});
        end
        %allDistances(j) = mean([compareNatural{i}{1:3}]);
        %allDistances(j) = sum(compareNatural{i}{1:3});
        for a=1:3
            sumup = sumup + compareNatural{i}{a};
        end
        allDistances(j) = sumup;
    end
    knnadd = zeros(1,4);
    %knnsearch(allDistances, 0)
    knnadd = sum(allDistances(knnsearch(allDistances, 0, 'K', 4)));
    naturalKnnList(i) = knnadd;
    %naturalKnnList(i) = allDistances(knnsearch(allDistances, 0))
end
for i=1:nTestHists
    if naturalKnnList(i) < manmadeKnnList(i)
        inNatural = inNatural + 1;
    else
        inManmade = inManmade + 1;
    end
end


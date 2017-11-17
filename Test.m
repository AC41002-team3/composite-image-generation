function [ inManmade, inNatural ] = Test( testHists, trainManmade, trainNatural) %send in, get percentage of each classified
%TEST Summary of this function goes here
%   Detailed explanation goes here
%1 = manmade %2 = natural
    inNatural = 0;
    inManmade = 0;
    histCalc{1}{1} = 0;
    nTestHists = length(testHists);
    nTrainManmade = length(trainManmade);
    nTrainNatural = length(trainNatural);
    nTotal = nTrainManmade;
    knnList = zeros(1,nTestHists);
    for i=1:nTestHists
        allDistances = zeros(nTotal,1);
       for j=1:nTotal
           final = 0;
           for a=1:3
               histCalc{i}{a} = ChiSquareDistance(testHists{i}{a}, trainManmade{j}{a}) - ChiSquareDistance(testHists{i}{a}, trainNatural{j}{a}); %>0 natural
           end
           histCalc{i};
           final = mean([histCalc{i}{1:3}]);
           allDistances(j) = final;
       end 
       knnLists(i) = allDistances(knnsearch(allDistances, 0));
       %if histCalc{i}{1} + histCalc{i}{2} > 0 || histCalc{i}{1} + histCalc{i}{3} > 0 || histCalc{i}{2} + histCalc{i}{3} > 0
       %        inNatural = inNatural + 1;
       %    else
       %        inManmade = inManmade + 1;
       %end
       knnLists(i);
       if knnLists(i) > 0
           inNatural = inNatural + 1;
       else if knnLists(i) == 0
           wow = "It was an exact match!"
       else
           inManmade = inManmade + 1;
       end
       %if histCalc{i}{1} + histCalc{i}{2} + histCalc{i}{3} > 0
       %     inNatural = inNatural + 1;
       %else
       %     inManmade = inManmade + 1;
       %end
        end
    end
end


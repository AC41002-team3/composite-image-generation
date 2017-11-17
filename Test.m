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
    for i=1:nTestHists
        final = {};
       for j=1:nTotal
           %count = 0;
           for a=1:3
               histCalc{i}{a} = ChiSquareDistance(testHists{i}{a}, trainManmade{j}{a}) - ChiSquareDistance(testHists{i}{a}, trainNatural{j}{a})
           end
           for b=1:3
               final{j} = final{j} + histCalc{i}{b};
               histCalc{i}{b} = 0;
           end
           %if count < 0 %manmade
           %    inNatural
           %else % natural
           %end
       end 
       awnser = knnsearch(final, 0)
       %if histCalc{i}{1} + histCalc{i}{2} > 0 || histCalc{i}{1} + histCalc{i}{3} > 0 || histCalc{i}{2} + histCalc{i}{3} > 0
       %        inNatural = inNatural + 1;
       %    else
       %        inManmade = inManmade + 1;
       %end
       %if histCalc{i}{1} + histCalc{i}{2} + histCalc{i}{3} > 0
       %     inNatural = inNatural + 1;
       %else
       %     inManmade = inManmade + 1;
       %end
    end
end


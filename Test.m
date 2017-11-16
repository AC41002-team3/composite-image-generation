function [ inManmade, inNatural ] = Test( testHists, trainManmade, trainNatural) %send in, get percentage of each classified
%TEST Summary of this function goes here
%   Detailed explanation goes here
    testHists;
    trainManmade;
    trainNatural;
    nTestHists = length(testHists);
    nTrainManmade = length(trainManmade);
    nTrainNatural = length(trainNatural);
    nTotal = nTrainManmade;
    parfor i=1:nTestHists
       for j=1:nTotal
           for a=1:3
               testHists{i}{a} = ChiSquareDistance(testHists{i}{a}, trainManmade{j}{a}) - ChiSquareDistance(testHists{i}{a}, trainNatural{j}{a})
           end
       end 
    end
    parfor i=n:nTestHists
        %maybe going to have to rework this, how do I know which is
        %manmade, possibly do one add and one minus and then do some sort
        %of comparison here
    end
end


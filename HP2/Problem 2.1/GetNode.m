function nextNode = GetNode(tabuList,pheromoneLevel,visibility,alpha,beta,startingNode)

    numberOfCities = length(visibility);
    r = rand; %Draw a randomNumber for RWS
    probabilitySum = 0;

    for i = 1:numberOfCities
        if ~ismember(i,tabuList)
            probability = StepProbability(pheromoneLevel,visibility,tabuList,alpha,beta,startingNode,i);
        else
            continue
        end
        probabilitySum = probabilitySum + probability;
        
        if probabilitySum > r
           nextNode = i;
           break
        end
    end
end
function nextNode = GetNode(tabuList,pheromoneLevel,visibility,alpha,beta)
    numberOfCities = length(visibility);
    startNode = tabuList(end);
    probabilities = zeros(1,numberOfCities);

    for i = 1:numberOfCities
        if ismember(i,tabuList)
            probabilities(i) = 0;
        else
            probabilities(i) = StepProbability(pheromoneLevel,visibility,tabuList,alpha,beta,...
                startNode,i);
        end
    end
    [~,nextNode] = max(probabilities);
end


function nextNode = GetNode(tabuList,pheromoneLevel,visibility,alpha,beta)
    numberOfCities = length(visibility);
    startNode = tabuList(end);
    probabilities = zeros(1,numberOfCities);

    for i = 1:numberOfCities
        if ~ismember(i,tabuList)
            probabilities(i) = StepProbability(pheromoneLevel,visibility,tabuList,alpha,beta,...
                startNode,i);
        else
            probabilities(i) = 0;
        end
    end
    probabilities
    [~,nextNode] = max(probabilities);
end


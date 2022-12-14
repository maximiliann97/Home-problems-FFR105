function stepProbability = StepProbability(pheromoneLevel,visibility,tabuList,alpha,beta,startNode,destNode)
    numberOfCities = length(visibility);
    denominator = 0;
    nominator = pheromoneLevel(startNode,destNode)^alpha * visibility(startNode,destNode)^beta;

    for i = 1:numberOfCities
        if ismember(i,tabuList)
            continue
        else
            denominator = denominator + (pheromoneLevel(startNode,i)^alpha * visibility(startNode,i)^beta);
        end
    end
    
    stepProbability = nominator / denominator;
end


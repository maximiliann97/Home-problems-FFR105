function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    numberOfCities = length(visibility);
    startNode = randi(numberOfCities);
    tabuList(1) = startNode;
    path(1) = startNode;
    for i = 1:numberOfCities
        nextNode = GetNode(tabuList,pheromoneLevel,visibility,alpha,beta);
        path(end+1) = nextNode;
        tabuList(end+1) = nextNode;
    end
end


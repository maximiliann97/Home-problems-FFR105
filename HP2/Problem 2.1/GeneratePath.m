function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

    numberOfCities = length(visibility);

    % Select Starting node randomly
    startingNode = randi(numberOfCities);

    %Initialize path and tabu list
    path = zeros(1,numberOfCities);
    tabuList(1) = startingNode;
    path(1) = startingNode;

    for i = 2:numberOfCities
        nextNode = GetNode(tabuList,pheromoneLevel,visibility,alpha,beta,startingNode);
        path(i) = nextNode;
        tabuList(i) = nextNode;
        startingNode = nextNode;
    end
end


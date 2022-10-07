function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    
    numberOfAnts = length(pathCollection);
    numberOfCities = height(pathCollection);
    deltaPheromoneLevel = zeros(numberOfCities);
    
    % Sum the delta pheromone level for each ant
    for k = 1:numberOfAnts
        path = pathCollection(k,:);
        pathLength = pathLengthCollection(k);
        for iCity = 1:(length(path)-1)
            jNode = path(iCity);
            iNode = path(iCity+1);
            deltaPheromoneLevel(iNode,jNode) = deltaPheromoneLevel(iNode,jNode) + 1/pathLength;
        end
    end
end


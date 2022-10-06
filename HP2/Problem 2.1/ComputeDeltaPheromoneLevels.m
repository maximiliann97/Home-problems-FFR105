function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    numberOfAnts = length(pathCollection);
    numberOfCities = height(pathCollection);
    deltaPheromoneLevel = zeros(numberOfCities,numberOfCities);
    
    % Sum the delta pheromone level for each ant
    for k = 1:numberOfAnts
        path = pathCollection(k,:);
        pathLength = pathLengthCollection(k);

        for iCity = 1:numberOfCities-1
            iNode = path(iCity);
            jNode = path(iCity+1);
            deltaPheromoneLevel(iNode,jNode) = deltaPheromoneLevel(iNode,jNode) + 1/pathLength;
        end
        % Pheromone for edge from final node to first node
        finalNode = path(end);
        firstNode = path(1);

        deltaPheromoneLevel(firstNode,finalNode) = deltaPheromoneLevel(firstNode,finalNode) + 1/pathLength;
        
    end
end


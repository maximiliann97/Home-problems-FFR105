function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
    numberOfCities = length(pheromoneLevel);

    for i = 1:numberOfCities
        for j = 1:numberOfCities
            pheromoneLevel(i,j) = (1-rho)*pheromoneLevel(i,j) + deltaPheromoneLevel(i,j);
            if pheromoneLevel(i,j) < 1e-15
                pheromoneLevel(i,j) = 1e-15;
            end
        end
    end
end


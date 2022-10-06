function visibility = GetVisibility(cityLocation)

    numberOfCities = length(cityLocation);
    euclideanDistance = zeros(numberOfCities,numberOfCities);

    for i = 1:numberOfCities
        for j = 1:numberOfCities
            xDistance = cityLocation(i,1) - cityLocation(j,1);
            yDistance = cityLocation(i,2) - cityLocation(j,2);
            euclideanDistance(i,j) = sqrt(xDistance^2 + yDistance^2);
        end
    end
    visibility = 1 ./ euclideanDistance;
    
end



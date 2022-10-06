function visibility = GetVisibility(cityLocation)

    numberOfCities = length(cityLocation);
    visibility = zeros(numberOfCities,numberOfCities);
    
    for i = 1:numberOfCities
        for j = 1:numberOfCities
            iCity = cityLocation(i,:);
            jCity = cityLocation(j,:);
            euclideanDistance = ComputeDistance(iCity, jCity);
            visibility(i,j) = 1 / euclideanDistance;
        end
    end
    
end



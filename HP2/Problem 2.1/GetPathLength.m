function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    for iNode = 1:length(path)-1
        nodeFrom = path(iNode);
        nodeTo = path(iNode+1);
        pathLength = pathLength + ComputeDistance(cityLocation(nodeTo,:),cityLocation(nodeFrom,:));
    end

    % Add distance from end node to start node to complete the path
    firstNode = path(1);
    finalNode = path(end);
    pathLength = pathLength + ComputeDistance(cityLocation(finalNode,:),cityLocation(firstNode,:));
    
end


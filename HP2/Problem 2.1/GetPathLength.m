function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    for iNode = 1:length(path)-1
        nodeFrom = path(iNode);
        nodeTo = path(iNode+1);
        xDistance = cityLocation(nodeTo,1) - cityLocation(nodeFrom,1);
        yDistance = cityLocation(nodeTo,2) - cityLocation(nodeFrom,2);
        distance = sqrt(xDistance^2+yDistance^2);
        pathLength = pathLength + distance;
    end

    % Add distance from end node to start node to complete the path
    firstNode = path(1);
    finalNode = path(end);
    xDistance = cityLocation(finalNode,1) - cityLocation(firstNode,1);
    yDistance = cityLocation(finalNode,2) - cityLocation(firstNode,2);
    distance = sqrt(xDistance^2+yDistance^2);
    pathLength = pathLength + distance;
    
end

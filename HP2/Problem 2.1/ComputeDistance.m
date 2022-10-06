function distance = ComputeDistance(pointOne,pointTwo)
    xDistance = pointOne(1) - pointTwo(1);
    yDistance = pointOne(2) - pointTwo(2);
    distance = sqrt(xDistance^2+yDistance^2);
end


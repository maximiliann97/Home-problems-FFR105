function fitness = EvaluateIndividual(x)
    
    fitnessFunction = (1.5-x(1)+x(1)*x(2))^2 + (2.25-x(1)+x(1)*x(2)^2)^2 ...
        + (2.625-x(1)+x(1)*x(2)^3)^2;
    fitness = 1/(fitnessFunction+1);
    
    

end
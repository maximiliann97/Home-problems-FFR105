%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change: (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;  	   % Do NOT change

tournamentSize = 3;                % Changes allowed
tournamentProbability = 0.75;      % Changes allowed (= pTour)
crossoverProbability = 0.82;        % Changes allowed (= pCross)
mutationProbability = 0.03;        % Changes allowed. (Note: 0.02 <=> 1/numberOfGenes)
numberOfGenerations = 4000;        % Changes allowed.

[maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);

x = bestVariableValues;                                  
g = (1.5-x(1)+x(1)*x(2))^2 + (2.25-x(1)+x(1)*x(2)^2)^2 ...
        + (2.625-x(1)+x(1)*x(2)^3)^2;
sprintf('Fitness: %d, x(1): %0.10f, x(2): %0.10f, g(x1,x2)=%d', maximumFitness, bestVariableValues(1), bestVariableValues(2), g)



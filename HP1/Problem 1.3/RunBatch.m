%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% Define more runs here (pMut < 0.02) ...
mutationProbabilityLesser = linspace(0, 0.02, 10);
maximumFitnessListSmallPmut = zeros(numberOfRuns,length(mutationProbabilityLesser));


for j = 1:length(mutationProbabilityLesser)
    sprintf('Mutation rate = %0.5f', mutationProbabilityLesser(j))
    for i = 1:numberOfRuns 
     [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbabilityLesser(j), numberOfGenerations);
     sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
      maximumFitnessListSmallPmut(i,j) = maximumFitness;
    end
end

% ... and here (pMut > 0.02)
mutationProbabilityGreater = linspace(0.02, 1, 10);
maximumFitnessListLargePmut = zeros(numberOfRuns,length(mutationProbabilityGreater));


for j = 1:length(mutationProbabilityGreater)
    sprintf('Mutation rate = %0.5f', mutationProbabilityGreater(j))
    for i = 1:numberOfRuns 
     [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbabilityGreater(j), numberOfGenerations);
     sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
      maximumFitnessListLargePmut(i,j) = maximumFitness;
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...
averageSmallPmut = mean(maximumFitnessListSmallPmut);
medianSmallPmut = median(maximumFitnessListSmallPmut);
stdSmallPmut = sqrt(var(maximumFitnessListSmallPmut));
sprintf('PMut: %0.10f: Median: %0.10f, Average: %0.10f, STD: %0.10f', mutationProbabilityLesser, averageSmallPmut, medianSmallPmut, stdSmallPmut)


subplot(1,2,1)
plot(mutationProbabilityLesser, medianSmallPmut,'r')
xlabel('Pmut')
ylabel('Median fitness score')
title(' 0 <= Pmut <= 0.2')
hold on


% ... and here (pMut > 0.02)
averageLargePmut = mean(maximumFitnessListLargePmut);
medianLargePmut = median(maximumFitnessListLargePmut);
stdLargePmut = sqrt(var(maximumFitnessListLargePmut));
sprintf('PMut: %0.10f: Median: %0.10f, Average: %0.10f, STD: %0.10f', mutationProbabilityGreater, averageLargePmut, medianLargePmut, stdLargePmut)


subplot(1,2,2)
plot(mutationProbabilityGreater, medianLargePmut,'b')
xlabel('Pmut')
ylabel('Median fitness score')
title(' 0.2 <= Pmut <= 1')



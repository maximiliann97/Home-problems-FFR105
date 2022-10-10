function newPopulation = NextGeneration(population, fitnessList, tournamentProbability, tournamentSize, nVariableRegisters, nConstantRegisters, crossoverProbability)
    newPopulation = [];
    populationSize = size(population,2);

    for i = 1:2:populationSize
        i1 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        r = rand;

        % Two-point Crossover
        parent1 = population(i1).Chromosome;
        parent2 = population(i2).Chromosome;
        if (r < crossoverProbability) 
             [newIndividual1, newIndividual2] = TwoPointCross(parent1, parent2);
        else
             newIndividual1 = parent1;
             newIndividual2 = parent2;
        end
    end

   % Mutation
   tempPopulation(1).Chromosome = population(iBestIndividual).Chromosome;
   for i = 2:populationSize
     tempIndividual = Mutate(tempPopulation(i).Chromosome,mutationProbability,operatorSet,nVariableRegisters,nConstantRegisters);
     tempPopulation(i).Chromosome = tempIndividual;
   end
   population = tempPopulation;
end


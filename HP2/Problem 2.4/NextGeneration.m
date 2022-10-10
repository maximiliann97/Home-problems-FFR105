function newPopulation = NextGeneration(population, fitnessList, tournamentProbability, tournamentSize, nVariableRegisters, nConstantRegisters, operatorSet,crossoverProbability, mutationProbability)
    newPopulation = [];
    populationSize = size(population,2);
    
    % Select two individual for tournament selection
    for i = 1:2:populationSize
        i1 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        r = rand;

        % Two-point Crossover
        parent1 = population(i1).Chromosome;
        parent2 = population(i2).Chromosome;
        if (r < crossoverProbability) 
             [offspring1, offspring2] = TwoPointCross(parent1, parent2);
        else
             offspring1 = parent1;
             offspring2 = parent2;
        end
    
    
       % Mutate
       offspring1 = Mutate(offspring1,mutationProbability,operatorSet,nVariableRegisters,nConstantRegisters);
       offspring2 = Mutate(offspring2,mutationProbability,operatorSet,nVariableRegisters,nConstantRegisters);
    
       % Reformat to structs
       newIndividual1 = struct('Chromosome', offspring1);
       newIndividual2 = struct('Chromosome', offspring2);
        
       % Next generation
       newPopulation = [newPopulation newIndividual1 newIndividual2];
   end
end


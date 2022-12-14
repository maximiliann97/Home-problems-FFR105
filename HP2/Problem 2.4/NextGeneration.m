function newPopulation = NextGeneration(population, fitnessList, tournamentProbability, tournamentSize, nVariableRegisters, nConstantRegisters, ...
    operatorSet,crossoverProbability, mutationConstant, eliteIndividual)
    populationSize = size(population,2);
    temporaryPopulation = population;

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
             temporaryPopulation(i).Chromosome = offspring1;
             temporaryPopulation(i+1).Chromosome = offspring2;
        else
             temporaryPopulation(i).Chromosome = parent1;
             temporaryPopulation(i+1).Chromosome = parent2;
        end
    end 
    
    % Place elite individual first in next generation
    temporaryPopulation(1).Chromosome = eliteIndividual;
    for i = 2:populationSize
        tempIndividual = Mutate(temporaryPopulation(i).Chromosome,mutationConstant,operatorSet,nVariableRegisters,nConstantRegisters);
        temporaryPopulation(i).Chromosome = tempIndividual;
    end
        
    % Next generation
    newPopulation = temporaryPopulation;

end


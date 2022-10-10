clear all;clc;

populationSize = 200;           
tournamentSize = 6;  %2             
tournamentProbability = 0.8; %0.75      
crossoverProbability = 0.1; %0.8        

lengthOfInstruction = 4;
% Just for initialization
minNumebrOfInstructionsInit = 2;
maxNumberOfInstructionsInit = 10;

minChromosomeLength = 8;
maxChromosomeLength = 180;

numberOfVariableRegisters = 3;
numberOfConstantRegisters = 3;
numberOfOperators = 4;
constantRegisters = [1, 3, -1];
operators = ['+', '-', '*', '/'];

functionData = LoadFunctionData;
population = InitializePopulation(populationSize, numberOfVariableRegisters, numberOfConstantRegisters,...
    numberOfOperators, lengthOfInstruction, maxNumberOfInstructionsInit, minNumebrOfInstructionsInit);
generations = 0;
maximumFitness  = 0.0;
crazyMutation = false;
count = 0;
TOL = 1e-2;
fitnessList = zeros(populationSize,1);

while maximumFitness < 100
    generations = generations + 1;
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessList(i) = EvaluateIndividual(chromosome, numberOfVariableRegisters,...
            constantRegisters, operators, functionData, maxChromosomeLength);
        if (fitnessList(i) > maximumFitness ) 
            maximumFitness  = fitnessList(i);
            iBestIndividual = i;
            bestChromosome = population(i).Chromosome;
            fprintf('Generation: %i, best fitness found: %.4f, by individual: %i\n',...
                generations, maximumFitness, iBestIndividual)
            if fitnessList(i) > 1012 % BEST LAST RUN, remove
            matlab.io.saveVariablesToScript('BestChromosome.m','bestChromosome');
            
            end
        end
    end
    
    if (max(fitnessList)-maximumFitness) < TOL
        count = count + 1;
        if count > 10000
            crazyMutation = true;
            count = 0;
        else
            crazyMutation = false;
        end
    end

    temporaryPopulation = population;  
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        r = rand;
        if (r < crossoverProbability) 
             individual1 = population(i1).Chromosome;
             individual2 = population(i2).Chromosome;
             [newIndividual1, newIndividual2] = Cross(individual1, individual2);
             temporaryPopulation(i).Chromosome = newIndividual1;
             temporaryPopulation(i+1).Chromosome = newIndividual2;
        else
             temporaryPopulation(i).Chromosome = population(i1).Chromosome;
             temporaryPopulation(i+1).Chromosome = population(i2).Chromosome;     
        end
    end
    
    temporaryPopulation(1).Chromosome = bestChromosome;
    for i = 2:populationSize
        tempIndividual = Mutate(temporaryPopulation(i).Chromosome,...
                lengthOfInstruction, numberOfOperators, numberOfVariableRegisters, numberOfConstantRegisters, crazyMutation);
        temporaryPopulation(i).Chromosome = tempIndividual;
    end
    population = temporaryPopulation;

end



%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-10
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 200;
M = 5; % number of variable registers
variableRegisters = zeros(1,M);
constantRegisters = [1 3 -1 -5 10];
mMax = 450;
N = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
instructionRange  = [10 100];

tournamentSize = 5;
tournamentProbability = 0.75;
crossoverProbability = 0.2;
mutationConstant = 3;
mutationDecayRate = 0.9999;
numberOfGenerations = 20000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
goatIndividual = struct('Chromosome', []);
goatFitness = 0; %goat = greatest of all time
fData = LoadFunctionData();
generation = 0;

while goatFitness < 100
    generation = generation + 1;
    fitnessList = zeros(1, populationSize);
    eliteFitness  = 0;
    eliteIndividual = struct('Chromosome', []);

    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessList(i) = EvaluateIndividual(chromosome,fData,operatorSet,registers,M,mMax);

        % Save the elite of this generation
        if eliteFitness < fitnessList(i)
            eliteIndividual = population(i).Chromosome;
            eliteFitness = fitnessList(i);
        end

        % Save the greatest of all time
        if goatFitness < fitnessList(i)
            goatIndividual = population(i);
            goatFitness = fitnessList(i);
            bestChromosome = population(i).Chromosome;
            fprintf('Best fitness so far %.4f Generation %.f\n', goatFitness, generation)
        end


    end
    
    %Form the next generation
    mutationConstant = mutationConstant*mutationDecayRate;
    population = NextGeneration(population, fitnessList, tournamentProbability, tournamentSize, M, N, operatorSet, crossoverProbability, mutationConstant,eliteIndividual);

    % Save elite individual as first in next generation
    %population(1) = eliteIndividual;
    
 
end






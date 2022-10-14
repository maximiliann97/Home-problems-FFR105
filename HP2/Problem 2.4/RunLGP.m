%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-14
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 200;
nVariableRegisters = 7; % number of variable registers
variableRegisters = zeros(1,nVariableRegisters);
constantRegisters = [1 3 -1];
pentaltyThresholdLength = 4*50;
penaltyExponent = 2;
cMax = 1e6;
nConstantRegisters = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
instructionRange  = [10 35];

tournamentSize = 6;
tournamentProbability = 0.8;
crossoverProbability = 0.2;
mutationNumber = 3;
mutationDecayRate = 0.9999;
numberOfGenerations = 20000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange, ...
    nVariableRegisters,nConstantRegisters,operatorSet);
goatIndividual = struct('Chromosome', []);
goatFitness = 0; %goat = greatest of all time
fData = LoadFunctionData();
generation = 0;

while goatFitness < 120
    generation = generation + 1;
    fitnessList = zeros(1, populationSize);
    eliteFitness  = 0;
    eliteIndividual = struct('Chromosome', []);

    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessList(i) = EvaluateIndividual(chromosome,fData,operatorSet, ...
            registers,nVariableRegisters,pentaltyThresholdLength,penaltyExponent,cMax);

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
            fprintf('Best fitness so far %.4f Generation %.f\n', goatFitness, ...
                generation)
        end


    end
    

    %Form the next generation
    mutationNumber = mutationNumber*mutationDecayRate;
    population = NextGeneration(population, fitnessList, tournamentProbability, ...
        tournamentSize, nVariableRegisters, nConstantRegisters, operatorSet, ...
        crossoverProbability, mutationNumber,eliteIndividual);

end






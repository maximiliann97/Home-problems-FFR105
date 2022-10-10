%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-10
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 100;
M = 3; % number of variable registers
variableRegisters = zeros(1,M);
constantRegisters = [-1 3 -7 11];
mMax = 450; %Included later!!!!!
N = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
instructionRange  = [10 50];

tournamentSize = 5;
tournamentProbability = 0.75;
crossoverProbability = 0.2;
mutationProbability = 0.04;
numberOfGenerations = 1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
goatIndividual = struct('Chromosome', []);
goatFitness = 0; %goat = greatest of all time
fData = LoadFunctionData();


for generation = 1:numberOfGenerations
    fitnessList = zeros(1, populationSize);
    eliteFitness  = 0;
    eliteIndividual = struct('Chromosome', []);

    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessList(i) = EvaluateIndividual(chromosome,fData,operatorSet,registers,M,mMax);

        % Save the elite of this generation
        if eliteFitness < fitnessList(i)
            eliteIndividual = population(i);
            eliteFitness = fitnessList(i);
        end

        % Save the greatest of all time
        if goatFitness < fitnessList(i)
            goatIndividual = population(i);
            goatFitness = fitnessList(i);
        end

    end

    %Form the next generation
    population = NextGeneration(population, fitnessList, tournamentProbability, tournamentSize, nVariableRegisters, nConstantRegisters, crossoverProbability);

    population(1) = eliteIndividual;
    

end










%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-08
clear all
clc
addpath .\StructExample

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications and initialization
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
numberOfGenerations = 1; %Change later


registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
fData = LoadFunctionData();


for generation = 1:numberOfGenerations
    maximumFitness  = 0.0;
    fitnessList = zeros(1, populationSize);
    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessList(i) = EvaluateIndividual(chromosome,fData,operatorSet,registers,M);
        if maximumFitness < fitnessList(i)
            maximumFitness = fitnessList(i);
            iBestIndividual = i;
          %  bestVariableValues = variableValues;
        end
    end
    
    % Tournament selection
    tempPopulation = population;
    for i = 1:2:populationSize
        i1 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelection(fitnessList,tournamentProbability,tournamentSize);
        r = 0;
    % Two-point Crossover
    if (r < crossoverProbability) 
         individual1 = population(i1).Chromosome;
         individual2 = population(i2).Chromosome;
         [newIndividual1, newIndividual2] = TwoPointCross(individual1, individual2);
         temporaryPopulation(i,:) = newIndividualPair(1,:);
         temporaryPopulation(i+1,:) = newIndividualPair(2,:);
    else
         temporaryPopulation(i,:) = population(i1,:);
         temporaryPopulation(i+1,:) = population(i2,:);     
    end
   end

   % Mutation
%    temporaryPopulation(1,:) = population(iBestIndividual,:);
%    for i = 2:populationSize
%      tempIndividual = Mutate(temporaryPopulation(i,:),mutationProbability);
%      temporaryPopulation(i,:) = tempIndividual;
%    end
%    population = temporaryPopulation;
end










clear all
clc

populationSize = 100;
M = 3; % number of variable registers
variableRegisters = zeros(1,M);
constantRegisters = [-1 3 7];
N = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
instructionRange  = [10 50];

tournamentSize = 5;
tournamentProbabiliy = 0.75;
crossoverProbability = 0.2;
mutationProbability = 0.04;
numberOfGenerations = 1000;


registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
fData = LoadFunctionData();



population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
chromosome = population(1).Chromosome;
chromosome1 = population(1).Chromosome;
chromosome2 = population(2).Chromosome;
fitness = EvaluateIndividual(chromosome,fData,operatorSet,registers,M);

%[newIndividual1, newIndividual2] = TwoPointCross(chromosome1,chromosome2);

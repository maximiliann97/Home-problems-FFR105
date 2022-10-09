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
N = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
instructionRange  = [10 50];

tournamentSize = 5;
tournamentProbabiliy = 0.75;
crossoverProbability = 0.2;
mutationProbability = 0.04;
numberOfGenerations = 2000;


registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,operatorSet);
fData = LoadFunctionData();


for generation = 1:numberOfGenerations
    maximumFitness  = 0.0;
    
    
    %% Evaluate
    for i = 1:populationSize
        
    end


    %% Tournament selection
    %% two-point Crossover
    %% mutations
end










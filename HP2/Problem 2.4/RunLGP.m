%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-08
clear all
clc
addpath .\StructExample

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 100;
nVariableRegisters = 3;
constantRegisters = [1 3 10];
nConstantRegisters = length(constantRegisters);
operatorSet = ['+','-','*','/'];
instructionRange  = [10 50];


tournamentSize = 5;
tournamentProbabiliy = 0.75;
crossoverProbability = 0.35;
mutationProbability = 0.04;
numberOfGenerations = 2000;



population = InitializePopulation(populationSize,instructionRange,nVariableRegisters,nConstantRegisters,operatorSet);
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










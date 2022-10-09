clear all
clc

populationSize = 10;
instructionRange = [1 5];
nVariableRegisters = 5;
constantRegisters = [-1 1 3];
nConstantRegisters = length(constantRegisters);
operatorSet = ['+','-','*','/'];



population = InitializePopulation(populationSize,instructionRange,nVariableRegisters,nConstantRegisters,operatorSet);
%registers = EvaluateFunction(population,operatorSet,nVariableRegisters, constantRegisters);

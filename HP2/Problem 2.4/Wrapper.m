clear all
clc

populationSize = 10;
instructionRange = [1 5];
nVariableRegisters = 5;
nConstantRegisters = 3;
operatorSet = ['+','-','*','/'];



population = InitializePopulation(populationSize,instructionRange,nVariableRegisters,nConstantRegisters,operatorSet);
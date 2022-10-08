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
constantRegister = [1 3 10];
operatorSet = ['+','-','*','/'];


tournamentSize = 5;
tournamentProbabiliy = 0.75;
crossoverProbability = 0.35;
mutationProbability = 0.04;
numberOfGenerations = 2000;












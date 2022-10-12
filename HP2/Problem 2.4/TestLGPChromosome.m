%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-12
clear all
clc

%Load best chromosome from BestChromsome.m
BestChromosome6
%Parameters and initaliation
nVariableRegisters = 5; % number of variable registers
variableRegisters = zeros(1,nVariableRegisters);
constantRegisters = [1 3 -1 -5 10];
registers = [variableRegisters constantRegisters];
nConstantRegisters = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
pentaltyThresholdLength = 4*120;
penaltyFactor = 0.9;
cMax = 1e15;
fData = LoadFunctionData;
nDataPoints = height(fData);
yEstimates = zeros(nDataPoints,1);



for k = 1:nDataPoints
    registers(1) = fData(k,1);
    for j = 2:nVariableRegisters
        registers(j) = 0;
    end

    output = DecodeInstructions(bestChromosome,registers,operatorSet,cMax);
    yEstimate = output(1);
    yEstimates(k) = yEstimate;
end
fitness = EvaluateIndividual(bestChromosome,fData,operatorSet,registers,nVariableRegisters,pentaltyThresholdLength,penaltyFactor,cMax);
error = 1/fitness;



<<<<<<< HEAD
fprintf('Error %.4f\n',error)
estimatedFunction = CalculateEstimatedFunction(bestChromosome,operatorSet,registers);
=======
fprintf('Error %0.4f\n',error)
>>>>>>> 044015c7b181ca2bbf0157c0123bc609a30b1e2b
estimatedFunction


figure(1)
hold on
plot(fData(:,1),fData(:,2),'r')
plot(fData(:,1),yEstimates(:),'b')
title('Comparison of LGP estimated values and data series from original function')
legend('Original function values','LGP-estimated values','Location','NorthWest')
xlabel('$$x$$','Interpreter','latex')
ylabel('$$y_{k}$$', 'Interpreter', 'Latex')

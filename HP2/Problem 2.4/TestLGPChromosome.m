%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-14
clear all
clc
clf

%Load best chromosome from BestChromsome.m
BestChromosome

%Parameters and initaliation
nVariableRegisters = 7; % number of variable registers
variableRegisters = zeros(1,nVariableRegisters);
constantRegisters = [1 3 -1];
registers = [variableRegisters constantRegisters];
nConstantRegisters = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
pentaltyThresholdLength = length(bestChromosome); %No penalty needed when comparing to the actual function
penaltyExponent = 2;
cMax = 1e6;
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
fitness = EvaluateIndividual(bestChromosome,fData,operatorSet,registers,nVariableRegisters,pentaltyThresholdLength,penaltyExponent,cMax);
error = 1/fitness;



fprintf('Error %d\n',error)
estimatedFunction = CalculateEstimatedFunction(bestChromosome,operatorSet,registers,nVariableRegisters)


figure(1)
hold on
plot(fData(:,1),fData(:,2),'r')
plot(fData(:,1),yEstimates(:),'bo')
title('Comparison of LGP estimated values and data series from original function')
legend('Original function values','LGP-estimated values','Location','NorthWest')
xlabel('$$x$$','Interpreter','latex')
ylabel('$$y_{k}$$', 'Interpreter', 'Latex')
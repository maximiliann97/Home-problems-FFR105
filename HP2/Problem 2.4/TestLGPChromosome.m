clear all
clc

bestChromosome = load('bestChromosome.mat');
bestChromosome = bestChromosome.goatIndividual.Chromosome;
M = 3; % number of variable registers
variableRegisters = zeros(1,M);
constantRegisters = [-1 3 -7 11];
registers = [variableRegisters constantRegisters];
N = length(constantRegisters); % number of constant registers
operatorSet = ['+','-','*','/'];
mMax = 450;
fData = LoadFunctionData;
K = height(fData);
yEstimates = zeros(K,1);

for k = 1:K
    registers(1) = fData(k,1);
    for j = 2:M
        registers(j) = 0;
    end

    output = DecodeInstructions(bestChromosome,registers,operatorSet);
    yEstimate = output(1);
    yEstimates(k) = yEstimate;
end
   
fitness = EvaluateIndividual(bestChromosome,fData,operatorSet,registers,M,mMax);
error = 1/fitness;


fprintf('Error %d\n' ,error)

function mutatedIndividual = Mutate(individual,mutationProbability, operatorSet, nVariableRegisters, nConstantRegisters)
    nGenes = length(individual);
    nRegisters = nVariableRegisters+nConstantRegisters;
    mutatedIndividual = individual;
    nOperator = length(operatorSet);
    
    for i = 1:nGenes/4
        r = rand;
        if (r < mutationProbability)
            iMutate = 1 + (i-1)*4;
            
            % Mutate operator
            mutatedIndividual(iMutate) = randi(nOperator);
            % Mutate destinationRegister
            mutatedIndividual(iMutate+1) = randi(nVariableRegisters);
            % Mutate operand 1
            mutatedIndividual(iMutate+2) = randi(nRegisters);
            % mutate operand 2
            mutatedIndividual(iMutate+3) = randi(nRegisters);
        end
    end
end
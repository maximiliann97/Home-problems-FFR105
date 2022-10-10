function mutatedIndividual = Mutate(individual,mutationConstant,operatorSet, nVariableRegisters, nConstantRegisters)
    nGenes = length(individual);
    nRegisters = nVariableRegisters+nConstantRegisters;
    mutatedIndividual = individual;
    nOperator = length(operatorSet);
    mutationProbability = mutationConstant/nGenes;
    
    for i = 1:nGenes/4
        iMutate = 1 + (i-1)*4;

        r = rand;
        if (r < mutationProbability)
            % Mutate operator
            mutatedIndividual(iMutate) = randi(nOperator);
        end

        r = rand;
        if (r < mutationProbability)
            % Mutate destinationRegister
            mutatedIndividual(iMutate+1) = randi(nVariableRegisters);
        end

        r = rand;
        if (r < mutationProbability)
            % Mutate operand 1
            mutatedIndividual(iMutate+2) = randi(nRegisters);
        end
        
        r = rand;
        if (r < mutationProbability)
            % Mutate operand 2
            mutatedIndividual(iMutate+3) = randi(nRegisters);
        end
    end
end
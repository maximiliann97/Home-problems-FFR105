function fitness = EvaluateIndividual(chromosome,fData,operatorSet,registers, ...
    nVariableRegisters,pentaltyThresholdLength,penaltyExponent,cMax)
    nGenes = length(chromosome);
    penaltyFactor = (pentaltyThresholdLength/nGenes)^penaltyExponent;
    K = height(fData);
    errorSum = 0;
    for k = 1:K
        registers(1) = fData(k,1);
        for j = 2:nVariableRegisters
            registers(j) = 0;
        end

        output = DecodeInstructions(chromosome,registers,operatorSet,cMax);
        yEstimate = output(1);
        errorSum = errorSum + (yEstimate - fData(k,2))^2;
    end
    
    error = sqrt(errorSum/K);
    fitness = 1/error;
    
    % Penalty factor
    if length(chromosome) > pentaltyThresholdLength
        fitness = fitness*penaltyFactor;
    end

end


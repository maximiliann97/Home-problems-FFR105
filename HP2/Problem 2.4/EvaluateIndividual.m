function fitness = EvaluateIndividual(chromosome,fData,operatorSet,registers,nVariableRegisters,mMax)
    K = height(fData);
    errorSum = 0;
    for k = 1:K
        registers(1) = fData(k,1);
        for j = 2:nVariableRegisters
            registers(j) = 0;
        end

        output = DecodeInstructions(chromosome,registers,operatorSet);
        yEstimate = output(1);
        errorSum = errorSum + (yEstimate - fData(k,2))^2;
    end
    
    error = sqrt(errorSum/K);
    fitness = 1/error;
    
    % Penalty factor
    if length(chromosome) > mMax
        fitness = fitness*0.9;
    end

end


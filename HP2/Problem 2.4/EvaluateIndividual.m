function fitness = EvaluateIndividual(chromosome,fData,operatorSet,registers,nVariableRegisters,mMax)
    K = height(fData);
    yEstimate = zeros(K,1);

    for k = 1:K
        registers(1) = fData(k,1);
        for j = 2:nVariableRegisters
            registers(j) = 0;
        end

        output = DecodeInstructions(chromosome,registers,operatorSet);
        yEstimate(k) = output(1);
    end
    error = sqrt(1/K * sum((yEstimate-fData(:,2)).^2));
    fitness = 1/error;
    
    % Penalty factor
    if length(chromosome) > mMax
        fitness = fitness*0.75;
    end

end


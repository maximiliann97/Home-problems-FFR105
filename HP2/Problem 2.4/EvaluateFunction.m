function estimateFunction = EvaluateFunction(chromosome,operatorSet,nVariableRegisters, constantRegisters, fData)
    nZeroVariableRegisters = nVariableRegisters - 1;
    zeroVariableRegisters = zeros(1,nZeroVariableRegisters);
    registers = ['x' string(zeroVariableRegisters) string(constantRegisters)];
    

end


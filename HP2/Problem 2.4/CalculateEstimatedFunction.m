function estimatedFunction = CalculateEstimatedFunction(individual, operatorSet, registers)
    nGenes = length(individual);

    syms x
    symRegisters = subs(registers,registers(1),x);
    symRegisters(2:5) = 0;
    
    for i = 1:4:nGenes
        operator = operatorSet(individual(i));
        destinationRegister = individual(i+1);
        operandOne = symRegisters(individual(i+2));
        operandTwo = symRegisters(individual(i+3));

        if operator == '+'
            symRegisters(destinationRegister) = operandOne + operandTwo;
        elseif operator == '-'
            symRegisters(destinationRegister) = operandOne - operandTwo;
        elseif operator == '*'
            symRegisters(destinationRegister) = operandOne * operandTwo;
        elseif operator == '/'
            symRegisters(destinationRegister) = operandOne / operandTwo;
        end
    end
    estimatedFunction = simplify(symRegisters(1));
end


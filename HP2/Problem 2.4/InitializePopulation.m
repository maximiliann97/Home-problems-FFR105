function population = InitializePopulation(populationSize,instructionRange,nVariableRegisters,nConstantRegisters,operatorSet)
    
    nOperands = nVariableRegisters + nConstantRegisters;
    nOperators = length(operatorSet);
    population = [];
    for i = 1:populationSize
        numberOfInstructions = randi(instructionRange);
        chromosome = zeros(1,numberOfInstructions*4);

        for j = 1:numberOfInstructions
            % Each instruction consists of 4 instances
            iInstruction = 1 + (j-1)*4;
            
            % Instruction instances are created
            % Order: Operator,destination register, operand 1, operand 2
            chromosome(iInstruction) = randi(nOperators);
            chromosome(iInstruction+1) = randi(nVariableRegisters);
            chromosome(iInstruction+2) = randi(nOperands);
            chromosome(iInstruction+3) = randi(nOperands);
        end
        individual = struct('Chromosome',chromosome);
        population = [population individual];
    end

    
end


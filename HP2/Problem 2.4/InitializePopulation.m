function population = InitializePopulation(populationSize,instructionRange,nVariableRegisters,nConstantRegisters)
    

    population = [];
    for i = 1:populationSize
        numberOfInstructions = instructionRange(1) - fix(rand*(instructionRange(2)-instructionRange(1)+1));
        chromosome = zeros(1, numberOfInstructions*4);

        for j = 1:numberOfInstructions
            
    
end


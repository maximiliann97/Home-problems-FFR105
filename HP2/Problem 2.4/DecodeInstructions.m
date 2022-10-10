function registers = DecodeInstructions(instructions,registers,operatorSet)
    nInstructions = length(instructions) / 4;
    cMax = 1e15;
    for i = 1:nInstructions
        instructionIndex = 1 + (i-1)*4;
        
        operator = operatorSet(instructions(instructionIndex));
        destinationRegister = instructions(instructionIndex+1);
        operandOne = registers(instructions(instructionIndex+2));
        operandTwo = registers(instructions(instructionIndex+3));
        result = registers(destinationRegister);


       switch operator
           case '+'
               result = operandOne + operandTwo;
           case '-'
               result = operandOne - operandTwo;
           case '*'
               result = operandOne * operandTwo;
           case '/'
               if operandTwo ~= 0
                   result = operandOne / operandTwo;
               else
                   result = cMax;
               end
       end
       registers(destinationRegister) = result;
    end
end


function output = DecodeInstructions(instructions,registers,operatorSet)
    nInstructions = length(instructions) / 4;

    for i = 1:nInstructions
        instructionIndex = 1 + (i-1)*4;
        operator = operatorSet(instructions(instructionIndex));
        destinationRegister = instructions(instructionIndex+1);
        operandOne = registers(instructions(instructionIndex+2));
        operandTwo = registers(instructions(instructionIndex+3));
        result = registers(destinationRegister);

       if operator == '+'
           result = operandOne + operandTwo;
       elseif operator == '-'
           result = operandOne - operandTwo;
       elseif operator == '*'
           result = operandOne * operandTwo;
       else
           if operandTwo ~= 0
               result = operandOne / operandTwo;
           else
               result = 1e15;
           end
       end
       output(destinationRegister) = result;
    end
end


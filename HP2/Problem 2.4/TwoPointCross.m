function [newIndividual1, newIndividual2] = TwoPointCross(individual1,individual2)
    nGenes1 = length(individual1);
    nGenes2 = length(individual2);


    % Crossover points for individual 1
    i1CrossoverPoints = -1;
    index = 1;
    while true
        betweenInstructionIndex1 = randi(nGenes1/4); % Index between instructions
        crossP = betweenInstructionIndex1*4-4;      % The actual crossover point -4 since you cant cross at the end
        if ~ismember(crossP,i1CrossoverPoints) && crossP ~= 0 % No duplicate points or crossover in beginning
            i1CrossoverPoints(index) = crossP; % Save crossover point
            index = index + 1;
        end

        if length(unique(i1CrossoverPoints)) == 2 % When 2 unique crossover points is obtained break
            break
        end
    end
    i1CrossoverPoints = sort(i1CrossoverPoints); % Sort crossover points


    % Crossover points for individual 2
    i2CrossoverPoints = -1;
    index = 1;
    while true
        betweenInstructionIndex2 = randi(nGenes2/4);
        crossP = betweenInstructionIndex2*4-4;
        if ~ismember(crossP,i2CrossoverPoints) && crossP ~= 0
            i2CrossoverPoints(index) = crossP;
            index = index + 1;
        end

        if length(unique(i2CrossoverPoints)) == 2
            break
        end
    end
    i2CrossoverPoints = sort(i2CrossoverPoints);


    % Two-point crossover
    i1SliceOne= individual1(1:i1CrossoverPoints(1));
    i2SliceOne = individual2(1:i2CrossoverPoints(1));

    i1SliceTwo = individual1(i1CrossoverPoints(1)+1:i1CrossoverPoints(2));
    i2SliceTwo = individual2(i2CrossoverPoints(1)+1:i2CrossoverPoints(2));

    i1SliceThree = individual1(i1CrossoverPoints(2)+1:end);
    i2SliceThree = individual2(i2CrossoverPoints(2)+1:end);

    newIndividual1 = [i1SliceOne i2SliceTwo i1SliceThree];
    newIndividual2 = [i2SliceOne i1SliceTwo i2SliceThree];
end

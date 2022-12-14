function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

    individualFitness = zeros(1,tournamentSize);
    individualIndex = zeros(1,tournamentSize);

    % Loop and saves index for selected individual and its fitness
    for i = 1:tournamentSize
        individualIndex(i) = randi(length(fitnessList));
        individualFitness(i) = fitnessList(individualIndex(i));
    end

    % Loop over the tournament size and select individual with highest
    % fitness. If r > pTournament the individual with highest fitness is
    % removed from the tournament by setting it to NaN. If there is only
    % one individual left it is choosen as the winner.

    
    for j = 1:tournamentSize
        r = rand;
        if (r < tournamentProbability)
            [~,iTmp] = max(individualFitness);
            selectedIndividualIndex = individualIndex(iTmp);
            break

        elseif j == tournamentSize
            [~,iTmp] = max(individualFitness);
            selectedIndividualIndex = individualIndex(iTmp);
        
        else
            [~,iTmp] = max(individualFitness);
            individualFitness(iTmp) = NaN;
        end
    end
        
end
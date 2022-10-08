function fitness = EvaluateIndividual(inputArg1,inputArg2,fData)
    K = length(fData):
    yEstimate = EvaluateFunction(fdata);
    y = EvaluateFunction();
    error = sqrt(1/K*sum(yEstimate-y).^2);
    fitness = 1/error;
end


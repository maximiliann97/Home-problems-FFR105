function func = EvaluateFunction(coordinates)

func = (coordinates(:,1).^2 + coordinates(:,2)-11).^2 + (coordinates(:,1)+coordinates(:,2).^2-7).^2;

end
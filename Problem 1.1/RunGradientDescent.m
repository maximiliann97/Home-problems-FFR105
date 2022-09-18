% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    x = xStart;
    gradF = ComputeGradient(x,mu);
    
    while gradientTolerance < norm(gradF)
  
        x = x-eta*ComputeGradient(x,mu);
        gradF = ComputeGradient(x,mu);

    end
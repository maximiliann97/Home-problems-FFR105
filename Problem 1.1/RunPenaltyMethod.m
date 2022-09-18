%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).


muValues = [1 10 100 1000 1100];
eta = 0.0001;
xStart =  [1 2];
gradientTolerance = 1E-6;

for i = 1:length(muValues)
 mu = muValues(i);
 x = RunGradientDescent(xStart,mu,eta,gradientTolerance);
 x1Values(i) = x(1);
 x2Values(i) = x(2);
 sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1),x(2),mu)
end


% Plot section
subplot(1,2,1)
plot(muValues,x1Values)
xlabel('\mu')
ylabel('x_1')

subplot(1,2,2)
plot(muValues,x2Values)
xlabel('\mu')
ylabel('x_2')


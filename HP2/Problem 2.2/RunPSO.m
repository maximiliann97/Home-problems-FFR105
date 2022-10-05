%Particle Swarm Optimization (PSO)
%Maximilian Salén 970105-1576
%Last updated: 2022-09-28
clear all
close all
clc
%% Find local minimas using contour Plot

format long

rangeX = linspace(-5,5);
rangeY = linspace(-5,5);
[X,Y] = meshgrid(rangeX,rangeY);
a = 0.01;
f = log(a+(X.^2 + Y-11).^2 + (X+Y.^2-7).^2);
contour(X,Y,f,'Showtext','on')
xlabel('x')
ylabel('y')


%% Parameters
maxIterations = 50000;
swarmSize = 35;

c1 = 2;
c2 = 2;
wMax = 1.4;
beta = 0.98;
wMin = 0.4;
deltaT = 1;
alpha = 1;

xMax = rangeX(end);
xMin = rangeX(1);
yMax = rangeY(end);
yMin = rangeY(1);
vMax = xMax;


%% Initialization

%Initialize swarm containing particles with random velocities and positions
for j=1:swarmSize
   randomNumberOne = rand;
   randomNumberTwo = rand;
   randomNumberThree = rand;
   randomNumberFour = rand;

   x(j) = xMin+randomNumberOne*(xMax-xMin);
   y(j) = yMin+randomNumberTwo*(yMax-yMin);
   xVelocity(j) = (alpha/deltaT)*(-(xMax-xMin)/2+randomNumberThree*(xMax-xMin));
   yVelocity(j) = (alpha/deltaT)*(-(yMax-yMin)/2+randomNumberFour*(yMax-yMin));
   
   velocities = [xVelocity;yVelocity]'; %Save velocity
   coordinates = [x;y]';                %Save coordinates
    
   % Evaluate particles
   storeEvaluateFunction = EvaluateFunction(coordinates)';
   [globalBestValue,globalBestIndex] = min(storeEvaluateFunction); %save the global best value and its index
   bestPerformance = coordinates(globalBestIndex,:);
   bestPosition = coordinates;
end


for k=1:maxIterations
    for i=1:swarmSize
       position = coordinates(i,:);
       evaluatedPosition = EvaluateFunction(position);
        
       if evaluatedPosition < EvaluateFunction(bestPosition(i,:))
          bestPosition(i,:) = position;
       end
    
       if evaluatedPosition < globalBestValue
          bestPerformance = position;
          globalBestValue = evaluatedPosition;  
       end
    
    end

    % Update velocity and position
    r = rand(swarmSize,1);
    q = rand(swarmSize,1);
    velocities = wMax.*velocities + c1*q.*(bestPosition-coordinates) + c2*r.*(bestPerformance-coordinates);
    velocities(velocities>vMax) = vMax;
    velocities(velocities<-vMax) = -vMax;
    
    coordinates = position + velocities;
    wMax = wMax*beta;
    
    
    %Set minimum inertia
    if wMax < wMin
        wMax = wMin;
    end


end


fprintf('Best position\n');
fprintf(' %4.15f\t',bestPerformance);
fprintf('\nFunction value of best position\n');
fprintf(' %d\n',globalBestValue);
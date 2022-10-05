%Particle Swarm Optimization (PSO)
%Maximilian Salén 970105
%2021-04-22
clear all;close all;clc
%% Contour Plot

format long
% Identify local minimas
xRange = linspace(-5,5);
yRange = linspace(-5,5);
[X,Y] = meshgrid(xRange,yRange);
a = 0.01;
func = log(a+(X.^2 + Y-11).^2 + (X+Y.^2-7).^2);
contour(X,Y,func)
xlabel('x')
ylabel('y')


%% Parameters
maxIterations = 100000;
swarmSize = 30;

c1 = 2;
c2 = 2;
wMax = 1.4;
beta = 0.99;
wMin = 0.4;
deltaT = 1;


xMax = xRange(end);
xMin = xRange(1);
yMax = yRange(end);
yMin = yRange(1);
vMax = xMax;


%% Initialization
%Initializes a swarm with paricles with random velocities and positions
for j=1:swarmSize
   randomNumber = rand;
   x(j) = xMin+randomNumber*(xMax-xMin);
   randomNumber = rand;
   y(j) = yMin+randomNumber*(yMax-yMin);
   randomNumber = rand;
   xVelocity(j) = (-(xMax-xMin)/2+randomNumber*(xMax-xMin));
   randomNumber = rand;
   yVelocity(j) = (-(yMax-yMin)/2+randomNumber*(yMax-yMin));
   
velocity = [xVelocity;yVelocity]'; %Saves velocity
coordinates = [x;y]';              %Saves coordinates

% Evaluation
SaveEvaluateFunction = EvaluateFunction(coordinates)';

[globalBest,globalBestIndex] = min(SaveEvaluateFunction); %saves the global best value and its index
sbPosition = coordinates(globalBestIndex,:);
pbPosition = coordinates;
end

for k=1:maxIterations
    
for i=1:swarmSize
      position = coordinates(i,:);
      evaluate = EvaluateFunction(position);
    
   if evaluate < EvaluateFunction(pbPosition(i,:))
     
      pbPosition(i,:) = position;
   end

   if evaluate < globalBest
       sbPosition = position;
       globalBest = evaluate;  
   end

end

% Update velocity and position
r = rand(swarmSize,1);
q = rand(swarmSize,1);
velocity = wMax.*velocity + c1*q.*(pbPosition-coordinates) + c2*r.*(sbPosition-coordinates);
velocity(velocity>vMax) = vMax;
velocity(velocity<-vMax) = -vMax;


coordinates = position + velocity;


wMax = wMax*beta;

%Set minimum inertia
if wMax < wMin
    wMax = wMin;
end


end


fprintf('Best position\n');
fprintf(' %4.15f\t',sbPosition);
fprintf('\nFunction value for best position\n');
fprintf(' %4.30f\n',globalBest);
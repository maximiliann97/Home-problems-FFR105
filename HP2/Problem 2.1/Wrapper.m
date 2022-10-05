clear all;
close all;
clc


cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

numberOfAnts = 50;  %% Changes allowed
alpha = 1.0;        %% Changes allowed
beta = 3.0;         %% Changes allowed
rho = 0.3;          %% Changes allowed
tau0 = 0.1;         %% Changes allowed
tabuList = [];

pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0); % To do: Write the InitializePheromoneLevels
visibility = GetVisibility(cityLocation);  

path = GeneratePath(pheromoneLevel,visibility,alpha,beta);
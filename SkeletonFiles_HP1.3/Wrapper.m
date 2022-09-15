clear all;close all;clc

fitness = [1 8 15 4 5 6];
pTournament = 0.1;
size = 3;

best = TournamentSelect(fitness,pTournament,size)

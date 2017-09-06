function food_surplus = foodSurplus(food_surplus, iDay, MoonBasePeople, cropStruct)
% 
% This function takes handles, the current day's production, the previous 
% food surplus, and the currentConsumption rate of food in order to 
% determine the amount of foodSurplus.
%       Author: Meg O'Brien
%       Date: April 2, 2017


%% Parameters
potato_prop = 1;

% initialize cropStruct
cropStruct(1).plant = 'potato';
cropStruct(1).harvestDate = 0;
cropStruct(1).calProduced = 0;

if iDay > 2
    load('plotFoodPoints', 't', 'food_surplus');
    load('cropStruct');
end

%% Calculations

currentConsumption = DaysFoodConsumption(MoonBasePeople);

% potato_needs = potatoNeeds(potato_prop, currentConsumption);
% dailyCropNeeded = potato_needs.NumPlanted; 

[currentProduction, cropStruct, potatoes_planted] = plantData('potato', cropStruct, iDay, MoonBasePeople);

save('cropStruct', 'cropStruct');

food_surplus(iDay) = food_surplus(iDay-1) + currentProduction - currentConsumption - potatoes_planted*max(0, normrnd(105, 5));

save('plotFoodPoints', 'food_surplus');

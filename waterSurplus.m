function water_surplus= waterSurplus(handles, water_surplus, dayNumber, MoonBasePeople)

% This function takes handles, the current day's production, the previous 
% water surplus, and the currentConsumption rate of water in order to 
% determine the amount of waterSurplus.
%       Author: Sarah A Hansen
%       Date: 9 April 2017

%% Parameters
load('Cargo');

% initial_water=352800;

t(1) = dayNumber;
water_surplus(1) = initial_water;

if dayNumber > 2
    load('plotWaterPoints');
end

%% Calculations

waterConsumption = DaysWaterConsumption(MoonBasePeople);
water_production = waterProduction(dayNumber);

% waterSurplus = water_surplus(MoonBasePeople);

water_surplus(dayNumber) = water_surplus(dayNumber-1) + water_production - waterConsumption;
t(dayNumber) = dayNumber; 

save('plotWaterPoints', 'water_surplus', 't', 'water_production');




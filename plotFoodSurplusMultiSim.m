function plotFoodSurplusMultiSim(iDay, MoonBasePeople, simulationStrategy, initial_food)
%
% This function plots the history of the food surplus.
%
%       Author: Meg O'Brien
%       Date: April 22, 2017


%% Parameters

switch simulationStrategy
    case 1
        if iDay == 1
            load('plotFoodPoints1');
            food_surplus1(iDay) = initial_food;
            disp(initial_food);
            save('plotFoodPoints1', 'food_surplus1');
        elseif iDay ~= 1
            foodSurplusMultiSim(iDay, MoonBasePeople, 1);
        end
        
    case 2
        if iDay == 1
            load('plotFoodPoints2');
            food_surplus2(iDay) = initial_food;
            save('plotFoodPoints2', 'food_surplus2');
        elseif iDay ~= 1
            foodSurplusMultiSim(iDay, MoonBasePeople, 2);
        end
        
    case 3
        if iDay == 1
            load('plotFoodPoints3');
            food_surplus3(iDay) = initial_food;
            save('plotFoodPoints3', 'food_surplus3');
        elseif iDay ~= 1
            foodSurplusMultiSim(iDay, MoonBasePeople, 3);
        end
        
end


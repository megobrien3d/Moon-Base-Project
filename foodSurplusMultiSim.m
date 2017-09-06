function foodSurplusMultiSim(iDay, MoonBasePeople, simulationStrategy)
%
% This function takes handles, the current day's production, the previous
% food surplus, and the currentConsumption rate of food in order to
% determine the amount of foodSurplus.
%       Author: Meg O'Brien
%       Date: April 2, 2017


%% Parameters
potato_prop = 1;

switch simulationStrategy
    case 1
        
        % initialize cropStruct
        cropStruct1(1).plant = 'potato';
        cropStruct1(1).harvestDate = 0;
        cropStruct1(1).calProduced = 0;
        
        if iDay == 1
            load('food_surplus1');
            food_surplus1(iDay) = initial_food;
            save('plotFoodPoints1', 'food_surplus1');
        end
        
        if iDay > 1
            load('plotFoodPoints1');
            
            if iDay > 2
                load('cropStruct1');
            end
            
            currentConsumption = DaysFoodConsumption(MoonBasePeople);
            [currentProduction, cropStruct1, potatoes_planted] = plantData('potato', cropStruct1, iDay, MoonBasePeople);
            save('cropStruct1', 'cropStruct1');
            food_surplus1(iDay) = food_surplus1(iDay-1) + currentProduction - currentConsumption - potatoes_planted*max(0, normrnd(105, 5));
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                food_surplus1(iDay) = food_surplus1(iDay) + food_surplus1(1);   % corresponds to adding initial food again because replenished by rocket
                MoonBasePeople = people_gen(length(MoonBasePeople));  % replace the current crew
                MoonBasePeople = calories_needs(MoonBasePeople);
                save('MoonBasePeople', 'MoonBasePeople');
            end
            
        end
        
        save('plotFoodPoints1', 'food_surplus1');
        
    case 2
        
        % initialize cropStruct
        cropStruct2(1).plant = 'potato';
        cropStruct2(1).harvestDate = 0;
        cropStruct2(1).calProduced = 0;
        
        
        if iDay == 1
            food_surplus2(iDay) = initial_food;
            save('plotFoodPoints2', 'food_surplus2');
        end
        
        if iDay > 1
            load('plotFoodPoints2');
            
            if iDay > 2
                load('cropStruct2');
            end
            
            currentConsumption = DaysFoodConsumption(MoonBasePeople);
            [currentProduction, cropStruct2, potatoes_planted] = plantData('potato', cropStruct2, iDay, MoonBasePeople);
            save('cropStruct2', 'cropStruct2');
            food_surplus2(iDay) = food_surplus2(iDay-1) + currentProduction - currentConsumption - potatoes_planted*max(0, normrnd(105, 5));
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                food_surplus2(iDay) = food_surplus2(iDay) + food_surplus2(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            save('plotFoodPoints2', 'food_surplus2');
        end
        
        
    case 3
        
        % initialize cropStruct
        cropStruct3(1).plant = 'potato';
        cropStruct3(1).harvestDate = 0;
        cropStruct3(1).calProduced = 0;
        
        if iDay == 1
            food_surplus3(iDay) = initial_food;
            save('plotFoodPoints3', 'food_surplus3');
        end
        
        if iDay > 1
            load('plotFoodPoints3');
            
            
            if iDay > 2
                load('cropStruct3');
            end
            
            currentConsumption = DaysFoodConsumption(MoonBasePeople);
            [currentProduction, cropStruct3, potatoes_planted] = plantData('potato', cropStruct3, iDay, MoonBasePeople);
            save('cropStruct3', 'cropStruct3');
            food_surplus3(iDay) = food_surplus3(iDay-1) + currentProduction - currentConsumption - potatoes_planted*max(0, normrnd(105, 5));
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                food_surplus3(iDay) = food_surplus3(iDay) + food_surplus3(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            save('plotFoodPoints3', 'food_surplus3');
        end
   
end
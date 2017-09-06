function waterSurplusMultiSim(water_surplus, iDay, MoonBasePeople, simulationStrategy, initial_water)

% This function is a modified version of waterSurplus. It calculates the
% water surplus of a given day for the purposes of the MultiSimulationTool.
%       Author: Sarah A Hansen
%       Date: 9 April 2017
%       Modified by Meg O'Brien on April 23, 2017

%% Parameters
potato_prop = 1;

switch simulationStrategy
    case 1
        
        if iDay == 1
            water_surplus1(iDay) = initial_water;
            save('plotWaterPoints1', 'water_surplus1');
        elseif iDay ~= 1
            load('plotWaterPoints1');
            
            waterConsumption = DaysWaterConsumption(MoonBasePeople);
            water_production = waterProductionMultiSim(MoonBasePeople);
            
            water_surplus1(iDay) = water_surplus1(iDay-1) + water_production - waterConsumption;
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                water_surplus1(iDay) = water_surplus1(iDay) + water_surplus1(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            
            save('plotWaterPoints1', 'water_surplus1');
        end
        
    case 2
        
        if iDay == 1
            water_surplus2(iDay) = initial_water;
            save('plotWaterPoints2', 'water_surplus2');
        elseif iDay ~= 1
            load('plotWaterPoints2');
            
            waterConsumption = DaysWaterConsumption(MoonBasePeople);
            water_production = waterProductionMultiSim(MoonBasePeople);
            
            water_surplus2(iDay) = water_surplus2(iDay-1) + water_production - waterConsumption;
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                water_surplus2(iDay) = water_surplus2(iDay) + water_surplus2(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            save('plotWaterPoints2', 'water_surplus2');
        end
        
    case 3
        
        if iDay == 1
            water_surplus3(iDay) = initial_water;
            save('plotWaterPoints3', 'water_surplus3');
        elseif iDay ~= 1
            load('plotWaterPoints3');
            
            waterConsumption = DaysWaterConsumption(MoonBasePeople);
            water_production = waterProductionMultiSim(MoonBasePeople);
            
            water_surplus3(iDay) = water_surplus3(iDay-1) + water_production - waterConsumption;
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                water_surplus3(iDay) = water_surplus3(iDay) + water_surplus3(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            save('plotWaterPoints3', 'water_surplus3');
        end
        
end

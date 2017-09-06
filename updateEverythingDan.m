function updateEverythingDan(handles, prevDay, advanceBy, popUpMenuNumber)
% This function updates the food calculations when you are in another menu,
% such as water, main menu, etc. It will supress the plot, but it will find
% the points for each first. 
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo', 'num_people', 'food_prop', 'water_prop', 'oxygen_prop', ...
    'MoonBasePeople', 'initial_vitamins', 'initial_food', ... 
    'initial_water', 'initial_oxygen');

% initialize cropStruct
cropStruct(1).plant = 'potato';
cropStruct(1).harvestDate = 0;
cropStruct(1).calProduced = 0;

num_people = length(MoonBasePeople);

load('plotFoodPoints', 't', 'food_surplus', 'vitamin_surplus', 'oxygen_surplus');
  

switch popUpMenuNumber
    case 1    % main menu
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            
            % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            % waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
%             oxygenMessages(handles,iDay);
            
            % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
            % fuelMessages(handles,iDay);
            
            EnergySurplus(handles,num_people,prevDay,advanceBy, iDay);           
%             energyMessages(handles,iDay);
            
        end
        
    case 2   % food
        for iDay=prevDay:(prevDay+advanceBy)

            % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            % waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            % oxygenMessages(handles,iDay);
            
            % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
            % fuelMessages(handles,iDay);
            
            EnergySurplus(handles,num_people,prevDay,advanceBy, iDay);
            %     energyMessages(handles,iDay);
            
        end
    case 3   % water
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            % oxygenMessages(handles,iDay);
            
            % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
            % fuelMessages(handles,iDay);
            
            WaterSurplus(handles,num_people,prevDay,advanceBy, iDay);
            %     energyMessages(handles,iDay);
            
        end
    case 4   % oxygen
        for iDay=prevDay:(prevDay+advanceBy)
            plotOxygenSurplus(handles, iDay, MoonBasePeople, true);
            oxygenMessages(handles,iDay);
            
            % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            % waterMessages(handles,iDay);
            
            % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
            % fuelMessages(handles,iDay);
            
%             EnergySurplus(handles,num_people,prevDay,advanceBy, iDay);
            %     energyMessages(handles,iDay);
            
        end
        
    case 5   % energy
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            
            % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            % waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            % oxygenMessages(handles,iDay);
            
            % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
            % fuelMessages(handles,iDay);
            
        end
        
    case 6
        for iDay=prevDay:(prevDay+advanceBy)   % fuel
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            
            % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            % waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            % oxygenMessages(handles,iDay);  
            
            EnergySurplus(handles,num_people,prevDay,advanceBy, iDay);
            %     energyMessages(handles,iDay);
            
        end
        
end

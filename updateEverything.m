function updateEverything(handles, prevDay, advanceBy, popUpMenuNumber)
% This function updates the food calculations when you are in another menu,
% such as water, main menu, etc. It will supress the plot, but it will find
% the points for each first. 
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo');

% initialize cropStruct
cropStruct(1).plant = 'potato';
cropStruct(1).harvestDate = 0;
cropStruct(1).calProduced = 0;

num_people = length(MoonBasePeople);

switch popUpMenuNumber
    case 1    % main menu
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            vitaminMessages(handles,iDay);
            
            plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            oxygenMessages(handles,iDay);
            
            handles.dText2.String = 'Energy';
            EnergySurplus(handles,num_people,iDay, num_solar_panels)           
            EnergyMessages(handles,iDay);
            
            handles.dayTrackerText.String = num2str(iDay);
            
        end
        
    case 2   % food
        for iDay=prevDay:(prevDay+advanceBy)

            vitaminMessages(handles,iDay);
            
            plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            oxygenMessages(handles,iDay);
            
            EnergySurplus(handles,num_people,iDay,num_solar_panels);
            EnergyMessages(handles,iDay);
            
        end
    case 3   % water
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            vitaminMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            oxygenMessages(handles,iDay);
            
            EnergySurplus(handles,num_people,iDay,num_solar_panels);
            EnergyMessages(handles,iDay);
            
        end
    case 4   % oxygen
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            vitaminMessages(handles,iDay);
            
            plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, true);
            oxygenMessages(handles,iDay);
            
            EnergySurplus(handles,num_people,iDay,num_solar_panels);
            EnergyMessages(handles,iDay);
            
        end
        
    case 5   % energy
        for iDay=prevDay:(prevDay+advanceBy)
            plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
            foodMessages(handles,iDay);
            vitaminMessages(handles,iDay);
            
            plotWaterSurplus(handles, iDay, MoonBasePeople, false);
            waterMessages(handles,iDay);
            
            plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
            oxygenMessages(handles,iDay);
            
        end
end

mainMessages(handles);



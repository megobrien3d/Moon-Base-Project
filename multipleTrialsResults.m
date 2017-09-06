function multipleTrialsResults(num_trials, end_day, handles)
% This function runs multiple trials of the simulation of the moon base and
% graphs the number of 

load('Cargo');
load('cropStruct');


for iDay=1:(end_day+1)
    t(iDay) = iDay; 
    
    plotFoodSurplus2(iDay, MoonBasePeople, cropStruct, false);
    EnergySurplus(handles,num_people,prevDay,advanceBy, iDay);  
    
        % plotWaterSurplus(handles, iDay, MoonBasePeople, false);
        % waterMessages(handles,iDay);

        % plotOxygenSurplus(handles, iDay, MoonBasePeople, false);
        % oxygenMessages(handles,iDay);

        % plotFuelSurplus(handles, iDay, MoonBasePeople, false);
        % fuelMessages(handles,iDay);

                 
%             energyMessages(handles,iDay);
            
    
    
end





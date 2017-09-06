function oxygen_surplus = oxygenSurplus(oxygen_surplus, iDay, MoonBasePeople)
% 
% This function finds the oxygen surplus by taking the previous day's
% oxygen surplus and adding the amount of oxygen produced (calculated in
% function oxygenProduction), and subtracting the amount of oxygen consumed
% by the people of the moon base.


%% Parameters
if iDay > 2
    load('plotOxygenPoints');
end

%% Calculations

currentOxygenConsumption = DaysOxygenConsumption(MoonBasePeople);

currentOxygenProduction=oxygenProduction(iDay); % oxygenProduction(iDay);

oxygen_surplus(iDay) = oxygen_surplus(iDay-1) + currentOxygenProduction - currentOxygenConsumption;

save('plotOxygenPoints');


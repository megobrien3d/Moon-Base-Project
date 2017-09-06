function oxygen_consumption = DaysOxygenConsumption(MoonBasePeople)
% 
% This function takes the data structure containing all the information on
% people and determines how many calories are consumed in the day.
% 
%       Author: Dan O'Connor
%       Date: April 2, 2017

oxygen_consumption = 0;

for ipeople=1:length(MoonBasePeople)
    oxygen_consumption = oxygen_consumption + MoonBasePeople(ipeople).oxygen_needs;
end

save('oxygen_consumption', 'oxygen_consumption');

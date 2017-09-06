function consumption = DaysFoodConsumption(MoonBasePeople)
% 
% This function takes the data structure containing all the information on
% people and determines how many calories are consumed in the day.
% 
%       Author: Meg O'Brien
%       Date: April 2, 2017

consumption = 0;

for ipeople=1:length(MoonBasePeople)
    consumption = consumption + MoonBasePeople(ipeople).calorie_needs;
end

save('consumption', 'consumption');

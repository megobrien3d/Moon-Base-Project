function food_production = foodProduction(dayNumber, cropStruct)
% This function finds the amount of food produced on a day by checking if 
% there is a harvest on a certain day and then if there is, it adds up that
% particular plot's worth of calories to the calorie production.
%       Author: Meg O'Brien
%       Comments updated April 22, 2017

food_production = 0;

for i=1:length(cropStruct)
    if cropStruct(i).harvestDate == dayNumber
        food_production = food_production + cropStruct(i).calProduced;
    end
end

function [food_production, cropStruct, potatoes_planted] = plantData(plant_type, cropStruct, dayNumber, MoonBasePeople)
%
%  plantData takes handles, plant_type (type of plant being planted),
%  cropStruct, which is a record of all the crops that have been planted,
%  dailyCropNeeded, which is a data structure which contains the number of
%  each type of crop that needed to be planted on average every day, and
%  the dayNumber (the day that the game is on).

%% Parameters
potato_prop = 1;

consumption = DaysFoodConsumption(MoonBasePeople);

if dayNumber > 2
    load('cropStruct');
end

%% Everything else

index = length(cropStruct) + 1;

switch plant_type
    case 'potato'
        cropStruct(index).plant = 'potato';
        harvestdate = max(0, (floor(normrnd(87.5, 2.5))+1))+dayNumber;    % assume normal distribution of harvest dates
        cropStruct(index).plantedDate = dayNumber;
        cropStruct(index).harvestDate = harvestdate;
        
        potato_needs = potatoNeeds(potato_prop, consumption);
        
        potatoes_planted = potato_needs.NumPlanted;
        
        for ipotato=1:potatoes_planted 
            potatoProd(ipotato) = max(0, floor(normrnd(6.5, 1.5)));  % assume normal distribution of produced number of potatoes
        end
            
        total_potatoes_prod = sum(potatoProd);
        cropStruct(index).calProduced = total_potatoes_prod*max(0, normrnd(105, 5));  
        % assume every potato in the plot gives the same number of
        % calories, but each plot can differ from others. Assume normal
        % distribution with average obtained by averaging two values I
        % found and the SD beging the difference between one of the numbers
        % and the average.
end


food_production = foodProduction(dayNumber, cropStruct);

save('cropStruct', 'cropStruct');

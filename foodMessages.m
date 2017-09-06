function foodMessages(handles, iDay)
%
% This function takes the information stored in handles and determines if a
% message is needed based on the amount of food surplus there is, etc. It
% determines what message to display to the GUI if there is not enough
% food.
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo');
load('plotFoodPoints');
load('messages');

consumption = DaysFoodConsumption(MoonBasePeople);

index = length(foodMessagesText);

% if index == 1
%     food_state = 'initial';    % basically just do this to make the program work
% elseif index > 1
%     food_state = split(foodMessagesText(end), 'level');
% end

last_message = cell2mat(foodMessagesText(end));

if strcmp(last_message((length(last_message)-6):end), 'rocket.')
    if food_surplus(iDay) > 4*30*consumption
        foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level sufficient.']);
        foodTextColor = [.47, .67, .19];   % green
    elseif food_surplus(iDay) < 4*30*consumption && food_surplus(iDay) >= 3*30*consumption  % critical values for food; CHANGE FOR EACH INDIVIDUAL THING
        foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level low']);
        foodTextColor = [.9, .94, .3];   % yellow
    elseif food_surplus(iDay) < 3*30*consumption
        foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level critical']);
        foodTextColor = [.8, .08, .18];   % red
    end
elseif food_surplus(iDay) <= 3*30*consumption
    food_state = split(foodMessagesText(end), 'level');
    
    if ~(strcmp(food_state(2), ' low') || strcmp(food_state(2), ' critical'))
        
        if food_surplus(iDay) < 4*30*consumption && food_surplus(iDay) >= 3*30*consumption  % critical values for food; CHANGE FOR EACH INDIVIDUAL THING
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level low']);
            foodTextColor = [.9, .94, .3];   % yellow
        elseif food_surplus(iDay) < 3*30*consumption
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level critical']);
            foodTextColor = [.8, .08, .18];   % red
        end
        
    elseif ~strcmp(food_state(2), ' critical')
        
        if food_surplus(iDay) < 3*30*consumption
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level critical']);
            foodTextColor = [.8, .08, .18];   % red
        elseif food_surplus(iDay) > 4*30*consumption
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level sufficient again']);
            foodTextColor = [.47, .67, .19];   % green
        end
    elseif strcmp(food_state(2), ' low') || strcmp(food_state(2), ' critical')
        
        if food_surplus(iDay) > 4*30*consumption
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level sufficient again']);
            foodTextColor = [.47, .67, .19];   % green
        elseif food_surplus(iDay) < 4*30*consumption && food_surplus(iDay) >= 3*30*consumption  % critical values for food; CHANGE FOR EACH INDIVIDUAL THING
            foodMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Food level low']);
            foodTextColor = [.9, .94, .3];   % yellow
        end
        
    end
    
    if handles.popUpMenu.Value == 1   % stays same
        handles.dText4.BackgroundColor = foodTextColor;
        pause(0.00001);
    end
end


mainMessages(handles);

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');    % leave this line EXACTLY as is   % leave this line EXACTLY as is


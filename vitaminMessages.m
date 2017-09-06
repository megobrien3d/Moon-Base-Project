function vitaminMessages(handles, iDay)
%
% This function takes the information stored in handles and determines if a
% message is needed based on the amount of vitamin surplus there is, etc. It
% determines what message to display to the GUI if there is not enough
% vitamin.
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo');
load('plotFoodPoints');
load('messages');

consumption = 1*num_people;

index = length(vitaminMessagesText);

last_message = cell2mat(vitaminMessagesText(end));

if strcmp(last_message((length(last_message)-6):end), 'rocket.')
    if vitamin_surplus(iDay) > 4*30*consumption
        vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level sufficient.']);
        vitaminTextColor = [.47, .67, .19];   % green
    elseif vitamin_surplus(iDay) < 4*30*consumption && vitamin_surplus(iDay) >= 3*30*consumption  % critical values for vitamin; CHANGE FOR EACH INDIVIDUAL THING
        vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level low']);
        vitaminTextColor = [.9, .94, .3];   % yellow
    elseif vitamin_surplus(iDay) < 3*30*consumption
        vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level critical']);
        vitaminTextColor = [.8, .08, .18];   % red
    end
elseif vitamin_surplus(iDay) <= 3*30*consumption
    vitamin_state = split(vitaminMessagesText(end), 'level');
    
    if ~(strcmp(vitamin_state(2), ' low') || strcmp(vitamin_state(2), ' critical'))
        
        if vitamin_surplus(iDay) < 4*30*consumption && vitamin_surplus(iDay) >= 3*30*consumption  % critical values for vitamin; CHANGE FOR EACH INDIVIDUAL THING
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level low']);
            vitaminTextColor = [.9, .94, .3];   % yellow
        elseif vitamin_surplus(iDay) < 3*30*consumption
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level critical']);
            vitaminTextColor = [.8, .08, .18];   % red
        end
        
    elseif ~strcmp(vitamin_state(2), ' critical')
        
        if vitamin_surplus(iDay) < 3*30*consumption
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level critical']);
            vitaminTextColor = [.8, .08, .18];   % red
        elseif vitamin_surplus(iDay) > 4*30*consumption
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level sufficient again']);
            vitaminTextColor = [.47, .67, .19];   % green
        end
    elseif strcmp(vitamin_state(2), ' low') || strcmp(vitamin_state(2), ' critical')
        
        if vitamin_surplus(iDay) > 4*30*consumption
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level sufficient again']);
            vitaminTextColor = [.47, .67, .19];   % green
        elseif vitamin_surplus(iDay) < 4*30*consumption && vitamin_surplus(iDay) >= 3*30*consumption  % critical values for vitamin; CHANGE FOR EACH INDIVIDUAL THING
            vitaminMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'vitamin level low']);
            vitaminTextColor = [.9, .94, .3];   % yellow
        end
        
    end
    
    if handles.popUpMenu.Value == 1   % stays same
        handles.dText5.BackgroundColor = vitaminTextColor;
        pause(0.00001);
        disp('hi vitamins');
    end
end


mainMessages(handles);

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');   % leave this line EXACTLY as is


function waterMessages(handles, iDay)
%
% This function takes the information stored in handles and determines if a
% message is needed based on the amount of water surplus there is, etc. It
% determines what message to display to the GUI if there is not enough
% water.
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo');
load('plotWaterPoints');
load('messages');

consumption = DaysWaterConsumption(MoonBasePeople);

index = length(waterMessagesText);

% if index == 1
%     water_state = 'initial';    % basically just do this to make the program work
% elseif index > 1
%     water_state = split(waterMessagesText(end), 'level');
% end

last_message = cell2mat(waterMessagesText(end));

if strcmp(last_message((length(last_message)-6):end), 'rocket.')
    if water_surplus(iDay) > 4*30*consumption
        waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level sufficient.']);
        waterTextColor = [.47, .67, .19];   % green
    elseif water_surplus(iDay) < 4*30*consumption && water_surplus(iDay) >= 3*30*consumption  % critical values for water; CHANGE FOR EACH INDIVIDUAL THING
        waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level low']);
        waterTextColor = [.9, .94, .3];   % yellow
    elseif water_surplus(iDay) < 3*30*consumption
        waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level critical']);
        waterTextColor = [.8, .08, .18];   % red
    end
elseif water_surplus(iDay) <= 3*30*consumption
    water_state = split(waterMessagesText(end), 'level');
    
    if ~(strcmp(water_state(2), ' low') || strcmp(water_state(2), ' critical'))
        
        if water_surplus(iDay) < 4*30*consumption && water_surplus(iDay) >= 3*30*consumption  % critical values for water; CHANGE FOR EACH INDIVIDUAL THING
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level low']);
            waterTextColor = [.9, .94, .3];   % yellow
        elseif water_surplus(iDay) < 3*30*consumption
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level critical']);
            waterTextColor = [.8, .08, .18];   % red
        end
        
    elseif ~strcmp(water_state(2), ' critical')
        
        if water_surplus(iDay) < 3*30*consumption
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level critical']);
            waterTextColor = [.8, .08, .18];   % red
        elseif water_surplus(iDay) > 4*30*consumption
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level sufficient again']);
            waterTextColor = [.47, .67, .19];   % green
        end
    elseif strcmp(water_state(2), ' low') || strcmp(water_state(2), ' critical')
        
        if water_surplus(iDay) > 4*30*consumption
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level sufficient again']);
            waterTextColor = [.47, .67, .19];   % green
        elseif water_surplus(iDay) < 4*30*consumption && water_surplus(iDay) >= 3*30*consumption  % critical values for water; CHANGE FOR EACH INDIVIDUAL THING
            waterMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'water level low']);
            waterTextColor = [.9, .94, .3];   % yellow
        end
        
    end
    
    if handles.popUpMenu.Value == 1   % stays same
        handles.dText6.BackgroundColor = waterTextColor;
        pause(0.00001);
    end
end


mainMessages(handles);

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');   % leave this line EXACTLY as is


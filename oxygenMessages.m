function oxygenMessages(handles, iDay)
%
% This function takes the information stored in handles and determines if a
% message is needed based on the amount of oxygen surplus there is, etc. It
% determines what message to display to the GUI if there is not enough
% oxygen.
%
%       Author: Meg O'Brien
%       Date: April 5, 2017

load('Cargo');
load('plotOxygenPoints');
load('messages');

consumption = DaysOxygenConsumption(MoonBasePeople);

index = length(oxygenMessagesText);

last_message = cell2mat(oxygenMessagesText(end));

if strcmp(last_message((length(last_message)-6):end), 'rocket.')
    if oxygen_surplus(iDay) > 4*30*consumption
        oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level sufficient.']);
        oxygenTextColor = [.47, .67, .19];   % green
    elseif oxygen_surplus(iDay) < 4*30*consumption && oxygen_surplus(iDay) >= 3*30*consumption  % critical values for oxygen; CHANGE FOR EACH INDIVIDUAL THING
        oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level low']);
        oxygenTextColor = [.9, .94, .3];   % yellow
    elseif oxygen_surplus(iDay) < 3*30*consumption
        oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level critical']);
        oxygenTextColor = [.8, .08, .18];   % red
    end
elseif oxygen_surplus(iDay) <= 3*30*consumption
    oxygen_state = split(oxygenMessagesText(end), 'level');
    
    if ~(strcmp(oxygen_state(2), ' low') || strcmp(oxygen_state(2), ' critical'))
        
        if oxygen_surplus(iDay) < 4*30*consumption && oxygen_surplus(iDay) >= 3*30*consumption  % critical values for oxygen; CHANGE FOR EACH INDIVIDUAL THING
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level low']);
            oxygenTextColor = [.9, .94, .3];   % yellow
        elseif oxygen_surplus(iDay) < 3*30*consumption
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level critical']);
            oxygenTextColor = [.8, .08, .18];   % red
        end
        
    elseif ~strcmp(oxygen_state(2), ' critical')
        
        if oxygen_surplus(iDay) < 3*30*consumption
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level critical']);
            oxygenTextColor = [.8, .08, .18];   % red
        elseif oxygen_surplus(iDay) > 4*30*consumption
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level sufficient again']);
            oxygenTextColor = [.47, .67, .19];   % green
        end
    elseif strcmp(oxygen_state(2), ' low') || strcmp(oxygen_state(2), ' critical')
        
        if oxygen_surplus(iDay) > 4*30*consumption
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level sufficient again']);
            oxygenTextColor = [.47, .67, .19];   % green
        elseif oxygen_surplus(iDay) < 4*30*consumption && oxygen_surplus(iDay) >= 3*30*consumption  % critical values for oxygen; CHANGE FOR EACH INDIVIDUAL THING
            oxygenMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'oxygen level low']);
            oxygenTextColor = [.9, .94, .3];   % yellow
        end
        
    end
    
    if handles.popUpMenu.Value == 1   % stays same
        handles.dText1.BackgroundColor = oxygenTextColor;
        pause(0.00001);
    end
end


mainMessages(handles);

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');   % leave this line EXACTLY as is


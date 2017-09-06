function EnergyMessages(handles, iDay)
%
load('plotEnergyPoints');
load('Cargo', 'MoonBasePeople');
crew=length(MoonBasePeople); %Handle associated with crew size input

critical=crew*12.5; %Sets a critical power level at one day's use for crew size at minimum usage
danger=critical*(4/3);  %Danger zone = twice the critical level
sufficient=critical*3;  %Sufficient power at 3 times critical level

load('messages');

index = length(energyMessagesText);

if index == 1
    energy_state = 'initial';    % basically just do this to make the program work 
elseif index > 1
    energy_state = split(energyMessagesText(end), 'level');
end


if ~(strcmp(energy_state(2), ' dangerous') || strcmp(energy_state(2), ' critical'))
    
    if PowerAvailable(iDay) <= danger && PowerAvailable(iDay) > critical  % critical values for food; CHANGE FOR EACH INDIVIDUAL THING
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level dangerous']);
        energyTextColor = [.9, .94, .3];   % yellow
    elseif PowerAvailable(iDay) <= critical
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level critical']);
        energyTextColor = [.8, .08, .18];   % red
    end
    
elseif ~strcmp(energy_state(2), ' critical')

    if PowerAvailable(iDay) <= critical
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level critical']);
        energyTextColor = [.8, .08, .18];   % red
    elseif PowerAvailable(iDay) >= sufficient
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level sufficient again']);
        energyTextColor = [.47, .67, .19];   % green
    end
elseif strcmp(energy_state(2), ' dangerous') || strcmp(energy_state(2), ' critical')

    if PowerAvailable(iDay) >= sufficient
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level sufficient again']);
        energyTextColor = [.47, .67, .19];   % green
    elseif PowerAvailable(iDay) <= danger && PowerAvailable(iDay) > critical  % critical values for food; CHANGE FOR EACH INDIVIDUAL THING
        energyMessagesText(index+1) = cellstr(['Day ' num2str(iDay) blanks(8-length(iDay)) 'Power level dangerous']);
        energyTextColor = [.9, .94, .3];   % yellow
    end
     
end

if handles.popUpMenu.Value == 1   % stays same
    handles.dText2.BackgroundColor = energyTextColor;   
    pause(0.00001);
end

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');    % leave this line EXACTLY as is

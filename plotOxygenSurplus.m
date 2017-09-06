function plotOxygenSurplus(handles, iDay, MoonBasePeople, doPlot)
%
% This function plots the history of the oxygen surplus.
%
%       Author: Dan O'Connor
%       Date: April 2, 2017


%% Parameters
load('Cargo', 'num_people', 'food_prop', 'water_prop', 'oxygen_prop', ...
    'MoonBasePeople', 'initial_vitamins', 'initial_food', ...
    'initial_water', 'initial_oxygen');
load('messages');

oxygen_surplus(1) = initial_oxygen;
t(1) = 1;

if iDay == 1
    t(iDay) = 1;
    oxygen_surplus(iDay) = initial_oxygen;
    save('plotOxygenPoints', 't', 'oxygen_surplus');
elseif iDay ~= 1
    load('plotOxygenPoints');
    t(iDay) = iDay;
    oxygen_surplus = oxygenSurplus(oxygen_surplus, iDay, MoonBasePeople);
    
    if mod(iDay, 360) == 0
        oxygen_surplus(iDay) = oxygen_surplus(iDay) + initial_water;
        last_element = length(oxygenMessagesText(end));
        oxygenMessagesText(last_element+1) = cellstr(['Day ' num2str(iDay) ...
            blanks(8-length(iDay)) num2str(initial_water) ' kg oxygen influx from rocket.']);
        save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
            'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
            'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
            'oxygenTextColor', 'energyTextColor', 'fuelTextColor');   % leave this line EXACTLY as is
    end
    
    if doPlot
        plot(t, oxygen_surplus, 'b-', t(end), oxygen_surplus(end), 'ro');
        xlabel('Day Number');
        ylabel('Oxygen Surplus (kcal)');
        title('Moon Base Oxygen Surplus, Day By Day');
        pause(0.0001);
        handles.dayTrackerText.String = num2str(iDay);
    end
    save('plotOxygenPoints', 't', 'oxygen_surplus');
end


%% update other things in the GUI

if handles.popUpMenu.Value == 4
    handles.dText4.String = 'Oxygen Surplus (kg)';
    handles.dText5.String = 'Daily OxygenConsumption';
    handles.dText6.String = '';
    handles.dText1.String = num2str(oxygen_surplus(end));
    handles.dText2.String = num2str(DaysOxygenConsumption(MoonBasePeople));
    handles.dText3.String = '';
end

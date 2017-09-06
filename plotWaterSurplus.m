function plotWaterSurplus(handles, iDay, MoonBasePeople, doPlot)
% This function plots the history of the water surplus.
%
%       Author: Sarah A Hansen
%       Date: 9 April 2017

%% Parameters
load('Cargo');
load('messages');
water_surplus(1) = initial_water;
t(1) = 1;

if iDay == 1
    t(iDay) = 1;
    water_surplus(iDay) = initial_water;
    save('plotWaterPoints', 't', 'water_surplus');
elseif iDay ~= 1
    load('plotWaterPoints', 't', 'water_surplus');
    t(iDay) = iDay;
    water_surplus = waterSurplus(handles, water_surplus, iDay, MoonBasePeople);
    
    if doPlot
        handles.dayTrackerText.String = num2str(iDay);
    end
    
    if mod(iDay, 360) == 0
        water_surplus(iDay) = water_surplus(iDay) + initial_water;
        last_element = length(waterMessagesText);
        waterMessagesText(last_element+1) = cellstr(['Day ' num2str(iDay) ...
            blanks(8-length(iDay)) num2str(initial_water) ' kg water influx from rocket.']);
        save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
            'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
            'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
            'oxygenTextColor', 'energyTextColor', 'fuelTextColor');   % leave this line EXACTLY as is
    end
    
    if doPlot ==1
        plot(t, water_surplus, 'b-', t(end), water_surplus(end), 'ro');
        xlabel('Day Number');
        ylabel('Water Surplus (kg)');
        title('Moon Base Water Surplus, Day By Day');
        pause(0.0001);
        handles.dayTrackerText.String = num2str(iDay);
    end
    save('plotWaterPoints', 't', 'water_surplus');
end

%% update other things in the GUI

% if handles.popUpMenu.Value == 2
if handles.popUpMenu.Value == 3
    handles.dText1.String = num2str(water_surplus(end));
    handles.dText2.String = num2str(DaysWaterConsumption(MoonBasePeople));
end


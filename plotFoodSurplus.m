function plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, doPlot)
%
% This function plots the history of the food surplus.
%
%       Author: Meg O'Brien
%       Date: April 2, 2017


%% Parameters
load('Cargo');
load('messages');
% load('Cargo', 'num_people', 'food_prop', 'water_prop', 'oxygen_prop', ...
%     'MoonBasePeople', 'initial_vitamins', 'initial_food', ...
%     'initial_water', 'initial_oxygen');
vit_per_person = 1;   % vitamins per person per day
food_surplus(1) = initial_food;
t(1) = 1;
rocket_launch_cost = 500*10^6;

if iDay == 1
    t(iDay) = 1;
    food_surplus(iDay) = initial_food;
    vitamin_surplus(1) = initial_vitamins;
    save('plotFoodPoints', 't', 'food_surplus', 'vitamin_surplus');
elseif iDay ~= 1
    load('plotFoodPoints', 't', 'food_surplus', 'vitamin_surplus');
    t(iDay) = iDay;
    food_surplus = foodSurplus(food_surplus, iDay, MoonBasePeople);
    vitamin_surplus(iDay) = vitamin_surplus(iDay-1)-length(MoonBasePeople);
    if mod(iDay, 360) == 0
        food_surplus(iDay) = food_surplus(iDay) + initial_food;
        MoonBasePeople = people_gen(num_people);      % replaces the crew
        handles.totalCostText.String = str2double(handles.totalCostText.String) + rocket_launch_cost;
        handles.dText2.String = str2double(DaysFoodConsumption(MoonBasePeople));
        
        last_element = length(foodMessagesText);
        foodMessagesText(last_element+1) = cellstr(['Day ' num2str(iDay) ...
            blanks(8-length(iDay)) num2str(initial_food) ' calorie influx from rocket.']);
        
        vitamin_surplus(iDay) = vitamin_surplus(iDay) + 360*num_people*vit_per_person;
        last_element_vit = length(vitaminMessagesText);
        vitaminMessagesText(last_element_vit+1) = cellstr(['Day ' num2str(iDay) ...
            blanks(8-length(iDay)) num2str(initial_vitamins) ' vitamin influx from rocket.']);
        
        
        save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
            'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
            'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
            'oxygenTextColor', 'energyTextColor', 'fuelTextColor');    % leave this line EXACTLY as is
        
        save('Cargo', 'num_people', 'food_prop', 'water_prop', 'oxygen_prop', ...
            'MoonBasePeople', 'initial_vitamins', 'initial_food', ...
            'initial_water', 'initial_oxygen', 'initial_hydrogen', 'num_solar_panels');
    end
    
    %     if vitamin_surplus(iDay) <= 0.3*length(MoonBasePeople)*initial_vitamins*vit_per_person;
    %         messages = handles.foodMessagesText.String;
    %         index = length(messages)+1;
    % %         print(messages);
    %         messages(index) = cellstr('Vitamin surplus below 30%');
    %         handles.foodMessagesText.String = messages;
    %     end
    if doPlot
        plot(t, food_surplus, 'b-', t(end), food_surplus(end), 'ro');
        xlabel('Day Number');
        ylabel('Calorie Surplus (kcal)');
        title('Calorie Surplus vs. Time');
        pause(0.0001);
        handles.dayTrackerText.String = num2str(iDay);
    end
    save('plotFoodPoints', 't', 'food_surplus', 'vitamin_surplus');
end


%% update other things in the GUI

if handles.popUpMenu.Value == 2
    handles.dText1.String = num2str(food_surplus(end));
    handles.dText2.String = num2str(DaysFoodConsumption(MoonBasePeople));
    handles.dText3.String = num2str(vitamin_surplus(end));
end



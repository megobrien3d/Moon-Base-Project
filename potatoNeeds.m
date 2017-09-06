function potato_needs = potatoNeeds(potato_prop, daily_calorie_needs)
% 
%   This function takes the proportion of calories coming from the crops to
%   be produced that will be potatoes and the total number of calories that 
%   need to be produced on average in a day and returns a data structure 
%   potatoNeeds that determines how many potatoes need to be produced. 
% 
%   The potato_needs array gives the amount needed on a per day basis.
%
%       Author: Meg O'Brien
%       Date: March 28, 2017

%% Parameters
% Nutrition
cal_per_potato = 110;   % in kilocalories
carb_per_potato = 26;   % in grams
protein_per_potato = 3; % in grams

%Production
min_potatoes_per_plant = 5; 
max_potatoes_per_plant = 8; 
average_production_per_plant = mean([min_potatoes_per_plant, max_potatoes_per_plant]);  % assume average is the mu

%Harvest 
min_harvest_time = 85;
max_harvest_time = 90;
average_harvest_time = mean([min_harvest_time, max_harvest_time]);   % assume average is the mu

%Potato plant spacing
soil_depth = 0.15;    % plant potatoes this many meters deep
interpotato_spacing = 0.23;   % plant potatoes this many meters away from one another
space_between_potato_plants = 0.23;   % in inches

%Watering
min_watering_rate_per_week = 0.0254; % meters of water
max_watering_rate_per_week = 0.0508; % meters of water
ave_watering_rate_per_week = mean([min_watering_rate_per_week, max_watering_rate_per_week]); % assume uniform distribution

%Percent "overproduction" to be safe (because the harvests are somewhat
%random so need to plant a little more than perfectly average in case
%produce below average
percent_overproduction = 1.15;  % produce this more than exactly average


%% Potato needed calculations
calories_from_potatoes = potato_prop*daily_calorie_needs;
num_potatoes_needed = percent_overproduction*calories_from_potatoes/cal_per_potato;
num_seeds_to_plant = floor(num_potatoes_needed/(average_production_per_plant-1));    % minus 1 because 1 potato will be used to be planted


% Planting scheme: assume square. Find the sidelengths closest to a square:
base = floor(sqrt(num_potatoes_needed));  % num of potatoes wide
height = floor(num_potatoes_needed/(num_potatoes_needed))+1;    % num of potatoes tall

potato_area_needed = (base-1)*(height-1)*(interpotato_spacing.^2);
soil_volume_needed = potato_area_needed*soil_depth;

% Water needed per day 
ave_watering_rate_per_day = ave_watering_rate_per_week/7;
water_volume_needed = potato_area_needed*ave_watering_rate_per_day;

%% give the potatoNeeds structure the information of water, soil, and area needs
potato_needs.NumPlanted = num_seeds_to_plant;
potato_needs.Area = potato_area_needed;
potato_needs.SoilVolume = soil_volume_needed;
potato_needs.WaterPerDayVolume = water_volume_needed;


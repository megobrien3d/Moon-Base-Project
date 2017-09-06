function updateWater(handles)
% This function updates the water calculations when you are in another menu,
% such as food, main menu, etc. It will supress the plot, but it will find
% the points for each first. 
%
%       Author: Sarah A Hansen
%       Date: 9 April 2017

load('Cargo') %'num_people', 'food_prop', 'water_prop', 'oxygen_prop', 'MoonBasePeople');
load('initial_water');

% initialize waterStruct

load('plotWaterPoints', 't', 'water_surplus');

prevDay = str2double(handles.dayTrackerText.String);

advanceDays = str2double(handles.numDaysText.String);  % time to advance by in days
advanceWeeks = str2double(handles.numWeeksText.String)*7; % 7 days a week
advanceMonths = str2double(handles.numMonthsText.String)*30;  % assume each month has 30 days
advanceYears = str2double(handles.numYearsText.String)*360;    % assume each year has 360 days

advanceBy = advanceDays + advanceWeeks + advanceMonths + advanceYears;

handles.dayTrackerText.String = num2str(prevDay+advanceBy);

for iDay=prevDay:(prevDay+advanceBy)
    plotWaterSurplus(handles, iDay, MoonBasePeople, false);
end
    

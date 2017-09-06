function UpdateEnergy(handles)
load('Cargo','num_people', 'food_prop', 'water_prop', 'oxygen_prop', 'MoonBasePeople');

%% Set parameters
Crew='num_people'; %Handle associated with crew size input
prevDay = str2double(handles.dayTrackerText.String);
    
    advanceDays = str2double(handles.numDaysText.String);  % time to advance by in days
    advanceWeeks = str2double(handles.numWeeksText.String)*7; % 7 days a week
    advanceMonths = str2double(handles.numMonthsText.String)*30;  % assume each month has 30 days
    advanceYears = str2double(handles.numYearsText.String)*360;    % assume each year has 360 days
    
    advanceBy = (advanceDays + advanceWeeks + advanceMonths + advanceYears);
    
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);

EnergySurplus(handles,num_people,prevDay,advanceBy);

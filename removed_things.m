%% Removed things


%% Line 185 of Food Tool (under if handles.popUpMenu.Value == 1 of goButton callback)
    % main menu things
        % all calculations 
        % check if anything is below the critical level
    
%     load('plotPoints', 't', 'food_surplus', 'vitamin_surplus');
%     
%     prevDay = str2double(handles.dayTrackerText.String);
%     
%     advanceDays = str2double(handles.numDaysText.String);  % time to advance by in days
%     advanceWeeks = str2double(handles.numWeeksText.String)*7; % 7 days a week
%     advanceMonths = str2double(handles.numMonthsText.String)*30;  % assume each month has 30 days
%     advanceYears = str2double(handles.numYearsText.String)*360;    % assume each year has 360 days
%     
%     advanceBy = advanceDays + advanceWeeks + advanceMonths + advanceYears;
%     
%     handles.dayTrackerText.String = num2str(prevDay+advanceBy);
% 
%     for iDay=prevDay:(prevDay+advanceBy)
%         plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, false);
%     end    
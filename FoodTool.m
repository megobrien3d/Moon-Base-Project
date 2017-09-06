function varargout = FoodTool(varargin)
% FoodTool MATLAB code for FoodTool.fig
%      FoodTool, by itself, creates a new FoodTool or raises the existing
%      singleton*.
%
%      H = FoodTool returns the handle to a new FoodTool or the handle to
%      the existing singleton*.
%
%      FoodTool('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FoodTool.M with the given input arguments.
%
%      FoodTool('Property','Value',...) creates a new FoodTool or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FoodTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FoodTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FoodTool

% Last Modified by GUIDE v2.5 18-Apr-2017 20:37:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @FoodTool_OpeningFcn, ...
    'gui_OutputFcn',  @FoodTool_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FoodTool is made visible.
function FoodTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FoodTool (see VARARGIN)

% Choose default command line output for FoodTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FoodTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

load('Cargo');
cost_per_square_meter_sol_panel = 91687.60;
sol_panel_cost = cost_per_square_meter_sol_panel*num_solar_panels;
rocket_launch_cost = 500*10^6;

handles.totalCostText.String = str2double(handles.totalCostText.String) ...
    + rocket_launch_cost + sol_panel_cost;

if handles.popUpMenu.Value == 1
    moonpic= imread('moon.jpg');
    image(moonpic);
    axis off
    axis image
    
    handles.dText1.String = 'Oxygen State';
    handles.dText2.String = 'Energy State';
    handles.dText3.String = '';
    handles.dText4.String = 'Food State';
    handles.dText5.String = 'Vitamin State';
    handles.dText6.String = 'Water State';
    
    handles.dText4.BackgroundColor = [0.94,0.94,0.94];
    handles.dText5.BackgroundColor = [0.94,0.94,0.94];
    handles.dText6.BackgroundColor = [0.94,0.94,0.94];
    handles.dText1.BackgroundColor = [0.94,0.94,0.94];
    handles.dText2.BackgroundColor = [0.94,0.94,0.94];
    handles.dText3.BackgroundColor = [0.94,0.94,0.94];
    
end


% --- Outputs from this function are returned to the command line.
function varargout = FoodTool_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% handles.totalCostText.String = num2str();    % cost of sending up

function numDaysText_Callback(hObject, eventdata, handles)
% hObject    handle to numDaysText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numDaysText as text
%        str2double(get(hObject,'String')) returns contents of numDaysText as a double


% --- Executes during object creation, after setting all properties.
function numDaysText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numDaysText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numWeeksText_Callback(hObject, eventdata, handles)
% hObject    handle to numWeeksText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numWeeksText as text
%        str2double(get(hObject,'String')) returns contents of numWeeksText as a double


% --- Executes during object creation, after setting all properties.
function numWeeksText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numWeeksText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numMonthsText_Callback(hObject, eventdata, handles)
% hObject    handle to numMonthsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numMonthsText as text
%        str2double(get(hObject,'String')) returns contents of numMonthsText as a double


% --- Executes during object creation, after setting all properties.
function numMonthsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numMonthsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numYearsText_Callback(hObject, eventdata, handles)
% hObject    handle to numYearsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numYearsText as text
%        str2double(get(hObject,'String')) returns contents of numYearsText as a double


% --- Executes during object creation, after setting all properties.
function numYearsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numYearsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in goButton.
function goButton_Callback(hObject, eventdata, handles)
% hObject    handle to goButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('Cargo');
num_people = length(MoonBasePeople);

% initialize cropStruct
cropStruct(1).plant = 'potato';
cropStruct(1).harvestDate = 0;
cropStruct(1).calProduced = 0;

prevDay = str2double(handles.dayTrackerText.String);

advanceDays = str2double(handles.numDaysText.String);  % time to advance by in days
advanceWeeks = str2double(handles.numWeeksText.String)*7; % 7 days a week
advanceMonths = str2double(handles.numMonthsText.String)*30;  % assume each month has 30 days
advanceYears = str2double(handles.numYearsText.String)*360;    % assume each year has 360 days

advanceBy = advanceDays + advanceWeeks + advanceMonths + advanceYears;

if handles.popUpMenu.Value == 1
    % main menu things
    
    updateEverything(handles, prevDay, advanceBy, 1);
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);
    
elseif handles.popUpMenu.Value == 2
    % food things
    % update food calculations and plot
    
    food_surplus(1) = initial_food;
    
    for iDay=prevDay:(prevDay+advanceBy)
        plotFoodSurplus(handles, iDay, MoonBasePeople, cropStruct, true);
        foodMessages(handles,iDay);
        updateText(handles);
    end
    
    updateEverything(handles, prevDay, advanceBy, 2);
    
elseif handles.popUpMenu.Value == 3  % water
    updateEverything(handles, prevDay, advanceBy, 3);
    
    water_surplus(1) = initial_water;
    
    doPlot = true;
    
    for iDay=prevDay:(prevDay+advanceBy)
        plotWaterSurplus(handles, iDay, MoonBasePeople, doPlot);
        foodMessages(handles,iDay);
        vitaminMessages(handles,iDay);
        updateText(handles);
    end
    
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);
    
    % water things
    % update water calculations and plot
    
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);
    
elseif handles.popUpMenu.Value == 4  % oxygen
    % update oxygen calculations and plot
    
    oxygen_surplus(1) = initial_oxygen;
    
    for iDay=prevDay:(prevDay+advanceBy)
        plotOxygenSurplus(handles, iDay, MoonBasePeople, true);
        oxygenMessages(handles,iDay);
        updateText(handles);
    end
    
    updateEverything(handles, prevDay, advanceBy, 4);
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);
    
elseif handles.popUpMenu.Value == 5  % energy
    updateEverything(handles, prevDay, advanceBy, 5);
    
    for iDay=prevDay:(prevDay+advanceBy)
        EnergySurplus(handles,num_people,iDay, num_solar_panels)
        EnergyMessages(handles,iDay);
        updateText(handles);
    end
    
    load('plotEnergyPoints');
    
    handles.dayTrackerText.String = num2str(prevDay+advanceBy);
    handles.dText1.String = num2str(PowerAvailable(end));
    handles.dText2.String = num2str(PowerUsed(end));
    
end

handles.numDaysText.String = num2str(0);
handles.numWeeksText.String = num2str(0);
handles.numMonthsText.String = num2str(0);
handles.numYearsText.String = num2str(0);


% --- Executes on selection change in popUpMenu.
function popUpMenu_Callback(hObject, eventdata, handles)
% hObject    handle to popUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popUpMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popUpMenu


load('Cargo');
load('messages');

% initialize cropStruct
cropStruct(1).plant = 'potato';
cropStruct(1).harvestDate = 0;
cropStruct(1).calProduced = 0;

if handles.popUpMenu.Value == 1
    
    moonpic= imread('moon.jpg');
    image(moonpic);
    axis off
    axis image
    
    % main menu things
    
    handles.dText1.String = 'Oxygen State';
    handles.dText1.BackgroundColor = oxygenTextColor;
    
    handles.dText2.String = 'Energy State';
    handles.dText2.BackgroundColor = energyTextColor;
    
    handles.dText3.String = '';
    %     handles.dText3.BackgroundColor = fuelTextColor;
    
    handles.dText4.String = 'Food State';
    handles.dText4.BackgroundColor = foodTextColor;
    
    handles.dText5.String = 'Vitamin State';
    handles.dText5.BackgroundColor = vitaminTextColor;
    
    handles.dText6.String = 'Water State';
    handles.dText6.BackgroundColor = waterTextColor;
    
    mainMessages(handles);
    
elseif handles.popUpMenu.Value == 2
    % food things
    
    consumption = DaysFoodConsumption(MoonBasePeople);
    
    if str2double(handles.dayTrackerText.String) > 1
        load('plotFoodPoints', 't', 'food_surplus', 'vitamin_surplus');
    end
    
    handles.dText4.String = 'Calorie Surplus (kcal):';
    handles.dText5.String = 'Current Daily Consumption Rate (kcal/day):';
    handles.dText6.String = 'Vitamin Surplus:';
    handles.dText3.String = num2str(vitamin_surplus(end));
    handles.dText2.String = num2str(consumption);
    handles.dText1.String = num2str(food_surplus(end));
    
    handles.dText1.BackgroundColor = [0.94,0.94,0.94];
    handles.dText2.BackgroundColor = [0.94,0.94,0.94];
    handles.dText3.BackgroundColor = [0.94,0.94,0.94];
    handles.dText4.BackgroundColor = [0.94,0.94,0.94];
    handles.dText5.BackgroundColor = [0.94,0.94,0.94];
    handles.dText6.BackgroundColor = [0.94,0.94,0.94];
    
    updateText(handles);
    plot(t, food_surplus, 'b-', t(end), food_surplus(end), 'ro');
    xlabel('Day Number');
    ylabel('Calorie Surplus (Kcal)');
    title('Calorie Surplus vs. Time');
    
elseif handles.popUpMenu.Value == 3
    % water things
    % update water calculations and plot
    
    water_surplus(1) = initial_water;
    t(1) = 1;
    
    if str2double(handles.dayTrackerText.String) > 1
        load('plotWaterPoints');
    end
    
    handles.dText4.String = 'Water Surplus(kg):';
    handles.dText5.String = 'Water Consumption(kg/day):';
    handles.dText6.String = 'Day''s Water Production (kg):';
    handles.dText3.String = num2str(water_surplus(end));
    handles.dText2.String = num2str(DaysWaterConsumption(MoonBasePeople));
    handles.dText1.String = num2str(waterProduction(str2double(handles.dayTrackerText.String)));
    
    handles.dText1.BackgroundColor = [0.94,0.94,0.94];
    handles.dText2.BackgroundColor = [0.94,0.94,0.94];
    handles.dText3.BackgroundColor = [0.94,0.94,0.94];
    handles.dText4.BackgroundColor = [0.94,0.94,0.94];
    handles.dText5.BackgroundColor = [0.94,0.94,0.94];
    handles.dText6.BackgroundColor = [0.94,0.94,0.94];
    
    updateText(handles);
    plot(t, water_surplus, 'b-', t(end), water_surplus(end), 'ro');
    xlabel('Day Number');
    ylabel('Water Surpus (kg)');
    title('Water Surplus vs. Time');
    
    
elseif handles.popUpMenu.Value == 4
    % oxygen things
    % update oxygen calculations and plot
    if str2double(handles.dayTrackerText.String) > 1
        load('plotOxygenPoints', 't', 'oxygen_surplus');
    end
    
    
    handles.dText4.String = 'Oxygen Surplus (kg):';
    handles.dText5.String = 'Current Daily Consumption Rate (kg/day):';
    handles.dText6.String = '';
    handles.dText3.String = '';
    %     handles.dText2.String = num2str(oxygen_consumption);
    %     handles.dText1.String = num2str(oxygen_surplus(end));
    
    handles.dText1.BackgroundColor = [0.94,0.94,0.94];
    handles.dText2.BackgroundColor = [0.94,0.94,0.94];
    handles.dText3.BackgroundColor = [0.94,0.94,0.94];
    handles.dText4.BackgroundColor = [0.94,0.94,0.94];
    handles.dText5.BackgroundColor = [0.94,0.94,0.94];
    handles.dText6.BackgroundColor = [0.94,0.94,0.94];
    
    updateText(handles);
    plot(t, oxygen_surplus, 'b-', t(end), oxygen_surplus(end), 'ro');
    xlabel('Day Number');
    ylabel('Oxygen Surplus (kg)');
    title('Oxygen Surplus vs. Time');
    
elseif handles.popUpMenu.Value == 5
    % energy things
    % update energy calculations and plot
    
    handles.dText1.BackgroundColor = [0.94,0.94,0.94];
    handles.dText2.BackgroundColor = [0.94,0.94,0.94];
    handles.dText3.BackgroundColor = [0.94,0.94,0.94];
    handles.dText4.BackgroundColor = [0.94,0.94,0.94];
    handles.dText5.BackgroundColor = [0.94,0.94,0.94];
    handles.dText6.BackgroundColor = [0.94,0.94,0.94];
    
    handles.dText4.String = 'Power Available (kW)';
    handles.dText5.String = 'Power Usage (kW)';
    handles.dText6.String = '';
    handles.dText1.String = '';
    handles.dText2.String = '';
    handles.dText3.String = '';
    
    if str2double(handles.dayTrackerText.String) > 1
        load('plotEnergyPoints');
        handles.dText1.String = num2str(PowerAvailable(end));
        handles.dText2.String = num2str(PowerUsed(end));
        plot(t(2:end), PowerAvailable(2:end), 'b-', t(end), PowerAvailable(end), 'ro');
        xlabel('Day Number');
        ylabel('Power Available (kW)');
        title('Power Available Each Day');
    end
    
    updateText(handles);
    
% elseif handles.popUpMenu.Value == 6
    % fuel things
end


% --- Executes during object creation, after setting all properties.
function popUpMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scrollUpButton.
function scrollUpButton_Callback(hObject, eventdata, handles)
% hObject    handle to scrollUpButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('messages');

% if exist('messagesIndex.mat', 'file') == 2
%     load('messagesIndex');
%     scrollMessages(mainMessagesText, messagesIndex, true, handles);
% else
%     if length(mainMessagesText) <= 10
%         pause(0.0000001);
%     elseif length(mainMessagesText) > 10
%         scrollMessages(mainMessagesText, (length(mainMessagesText)-10), true, handles);
%     end
% end

if handles.popUpMenu.Value == 1
    if length(allMessages)>10
        handles.messagesText.String = allMessages(1:10);
    end

elseif handles.popUpMenu.Value == 2
    if length(foodMessagesText) > 10
        handles.messagesText.String = foodMessagesText(1:10);
    end

elseif handles.popUpMenu.Value == 3
    if length(waterMessagesText) > 10
        handles.messagesText.String = waterMessagesText(1:10);
    end

elseif handles.popUpMenu.Value == 4
    if length(oxygenMessagesText) > 10
        handles.messagesText.String = oxygenMessagesText(1:10);
    end

elseif handles.popUpMenu.Value == 5
    if length(energyMessagesText) > 10
        handles.messagesText.String = energyMessagesText(1:10);
    end

elseif handles.popUpMenu.Value == 6
    if length(fuelMessagesText) > 10
        handles.messagesText.String = fuelMessagesText(1:10);
    end

end


% --- Executes on button press in scrollDownButton.
function scrollDownButton_Callback(hObject, eventdata, handles)
% hObject    handle to scrollDownButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('messages');

% if exist('messagesIndex.mat', 'file') == 2
%     load('messagesIndex');
%     scrollMessages(mainMessagesText, messagesIndex, true, handles);
% else
%     if length(mainMessagesText) <= 10
%         pause(0.0000001);
%     elseif length(mainMessagesText) > 10
%         scrollMessages(mainMessagesText, (length(mainMessagesText)-10), true, handles);
%     end
% end


if handles.popUpMenu.Value == 1
    if length(allMessages) > 10   % all 3s to 10s and 2s to 9s
        handles.messagesText.String = allMessages((length(allMessages)-9):end);
    end

elseif handles.popUpMenu.Value == 2
    if length(foodMessagesText) > 10
        handles.messagesText.String = foodMessagesText((length(foodMessagesText)-9):end);
    end

elseif handles.popUpMenu.Value == 3
    if length(waterMessagesText) > 10
        handles.messagesText.String = waterMessagesText((length(waterMessagesText)-9):end);
    end

elseif handles.popUpMenu.Value == 4
    if length(oxygenMessagesText) > 10
        handles.messagesText.String = oxygenMessagesText(length((oxygenMessagesText)-9):end);
    end

elseif handles.popUpMenu.Value == 5
    if length(energyMessagesText) > 10
        handles.messagesText.String = energyMessagesText((length(energyMessagesText)-9):end);
    end

elseif handles.popUpMenu.Value == 6
    if length(fuelMessagesText) > 10
        handles.messagesText.String = fuelMessagesText((length(fuelMessagesText)-9):end);
    end

end

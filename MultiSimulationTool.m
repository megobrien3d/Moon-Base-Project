function varargout = MultiSimulationTool(varargin)
% MULTISIMULATIONTOOL MATLAB code for MultiSimulationTool.fig
%      MULTISIMULATIONTOOL, by itself, creates a new MULTISIMULATIONTOOL or raises the existing
%      singleton*.
%
%      H = MULTISIMULATIONTOOL returns the handle to a new MULTISIMULATIONTOOL or the handle to
%      the existing singleton*.
%
%      MULTISIMULATIONTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTISIMULATIONTOOL.M with the given input arguments.
%
%      MULTISIMULATIONTOOL('Property','Value',...) creates a new MULTISIMULATIONTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MultiSimulationTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MultiSimulationTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MultiSimulationTool

% Last Modified by GUIDE v2.5 24-Apr-2017 09:38:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MultiSimulationTool_OpeningFcn, ...
    'gui_OutputFcn',  @MultiSimulationTool_OutputFcn, ...
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


% --- Executes just before MultiSimulationTool is made visible.
function MultiSimulationTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MultiSimulationTool (see VARARGIN)

% Choose default command line output for MultiSimulationTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MultiSimulationTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

rng('shuffle');

% --- Outputs from this function are returned to the command line.
function varargout = MultiSimulationTool_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numSimulations_Callback(hObject, eventdata, handles)
% hObject    handle to numSimulations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSimulations as text
%        str2double(get(hObject,'String')) returns contents of numSimulations as a double


% --- Executes during object creation, after setting all properties.
function numSimulations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSimulations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numPeople_Callback(hObject, eventdata, handles)
% hObject    handle to numPeople (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numPeople as text
%        str2double(get(hObject,'String')) returns contents of numPeople as a double


% --- Executes during object creation, after setting all properties.
function numPeople_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numPeople (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lengthSimulation_Callback(hObject, eventdata, handles)
% hObject    handle to lengthSimulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lengthSimulation as text
%        str2double(get(hObject,'String')) returns contents of lengthSimulation as a double


% --- Executes during object creation, after setting all properties.
function lengthSimulation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lengthSimulation (see GCBO)
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

clear VARIABLES
cla();
delete *.mat

tot_cargo_mass = 69853.225;    % in kg
food_mass_density = 105/.149;   % in calories per kg

initial_food1 = str2double(handles.percentWeightFood1.String)*(1/100)*food_mass_density*tot_cargo_mass;
initial_water1 = str2double(handles.percentWeightWater1.String)*(1/100)*tot_cargo_mass;
initial_oxygen1 = str2double(handles.percentWeightOxygen1.String)*(1/100)*tot_cargo_mass;
initial_hydrogen1 = str2double(handles.percentWeightHydrogen1.String)*(1/100)*tot_cargo_mass;
num_solar_panels1 = str2double(handles.numSolarPanels1.String);

initial_food2 = str2double(handles.percentWeightFood2.String)*(1/100)*food_mass_density*tot_cargo_mass;
initial_water2 = str2double(handles.percentWeightWater2.String)*(1/100)*tot_cargo_mass;
initial_oxygen2 = str2double(handles.percentWeightOxygen2.String)*(1/100)*tot_cargo_mass;
initial_hydrogen2 = str2double(handles.percentWeightHydrogen2.String)*(1/100)*tot_cargo_mass;
% num_solar_panels2 = str2double(handles.numSolarPanels2.String);

initial_food3 = str2double(handles.percentWeightFood3.String)*(1/100)*food_mass_density*tot_cargo_mass;
initial_water3 = str2double(handles.percentWeightWater3.String)*(1/100)*tot_cargo_mass;
initial_oxygen3 = str2double(handles.percentWeightOxygen3.String)*(1/100)*tot_cargo_mass;
initial_hydrogen3 = str2double(handles.percentWeightHydrogen3.String)*(1/100)*tot_cargo_mass;
% num_solar_panels3 = str2double(handles.numSolarPanels3.String);

final_day = str2double(handles.lengthSimulation.String);
simulations_num = str2double(handles.numSimulations.String);
num_people = str2double(handles.numPeople.String);

scoreSimulation1 = 0;
scoreSimulation2 = 0;
scoreSimulation3 = 0;

for iSimulation=1:simulations_num
    
    MoonBasePeople = people_gen(num_people);
    MoonBasePeople = calories_needs(MoonBasePeople);
    food_consumption = DaysFoodConsumption(MoonBasePeople);
    water_consumption = DaysWaterConsumption(MoonBasePeople);
    oxygen_consumption = DaysOxygenConsumption(MoonBasePeople);
    avg_energy_consumption = 13.7500*num_people;    % average value of energy consumption
    
    food_surplus1 = zeros(1,final_day);
    food_surplus2 = zeros(1,final_day);
    food_surplus3 = zeros(1,final_day);
    
    save('plotFoodPoints1', 'food_surplus1');
    save('plotFoodPoints2', 'food_surplus2');
    save('plotFoodPoints3', 'food_surplus3');
    
    water_surplus1 = zeros(1,final_day);
    water_surplus2 = zeros(1,final_day);
    water_surplus3 = zeros(1,final_day);
    
    oxygen_surplus1 = zeros(1,final_day);
    oxygen_surplus2 = zeros(1,final_day);
    oxygen_surplus3 = zeros(1,final_day);
    
    energy_surplus1 = zeros(1,final_day);
    
    for iDay=1:final_day
        
        if iDay == 361 || iDay == 2*360+1 || iDay == 3*360+1 || ...
                iDay == 4*360+1 || iDay == 5*360+1 || iDay == 6*360+1 ...
                || iDay == 7*360+1 || iDay == 8*360+1 || iDay == 9*360+1 ...
                || iDay == 10*360+1
            load('MoonBasePeople');
        end
        
        plotFoodSurplusMultiSim(iDay, MoonBasePeople, 1, initial_food1);
        plotFoodSurplusMultiSim(iDay, MoonBasePeople, 2, initial_food2);
        plotFoodSurplusMultiSim(iDay, MoonBasePeople, 3, initial_food3);
        
        waterSurplusMultiSim(water_surplus1, iDay, MoonBasePeople, 1, initial_water1);
        waterSurplusMultiSim(water_surplus2, iDay, MoonBasePeople, 2, initial_water2);
        waterSurplusMultiSim(water_surplus3, iDay, MoonBasePeople, 3, initial_water3);
        
        oxygenSurplusMultiSim(iDay, MoonBasePeople, 1, initial_oxygen1, initial_hydrogen1, num_people);
        oxygenSurplusMultiSim(iDay, MoonBasePeople, 2, initial_oxygen2, initial_hydrogen2, num_people);
        oxygenSurplusMultiSim(iDay, MoonBasePeople, 3, initial_oxygen3, initial_hydrogen3, num_people);
        
        energySurplusMultiSim(iDay, MoonBasePeople, 1, num_solar_panels1, num_people);
%         energySurplusMultiSim(iDay, MoonBasePeople, 2, num_solar_panels2, num_people);
%         energySurplusMultiSim(iDay, MoonBasePeople, 3, num_solar_panels3, num_people);

    end
    
    score_food_1 = 0;
    score_food_2 = 0;
    score_food_3 = 0;
    
    score_water_1 = 0;
    score_water_2 = 0;
    score_water_3 = 0;
    
    score_oxygen_1 = 0;
    score_oxygen_2 = 0;
    score_oxygen_3 = 0;
    
    score_energy_1 = 0;
%     score_energy_2 = 0; 
%     score_energy_3 = 0;
    
    load('plotFoodPoints1');
    load('plotFoodPoints2');
    load('plotFoodPoints3');
    
    load('plotWaterPoints1');
    load('plotWaterPoints2');
    load('plotWaterPoints3');
    
    load('plotOxygenPoints1');
    load('plotOxygenPoints2');
    load('plotOxygenPoints3');
    
    load('plotEnergyPoints1');
    
    daysBy = 1;
%     
%     for iDay = 1:daysBy:final_day
%         
%         % food
%         if food_surplus1(iDay) <= 4*30*food_consumption && food_surplus1(iDay) > 3*30*food_consumption
%             score_food_1 = score_food_1 + 0.5;
%         elseif food_surplus1(iDay) <= 3*30*food_consumption && food_surplus1(iDay) > 0
%             score_food_1 = score_food_1 + 0.25;
%         elseif food_surplus1(iDay) <= 0
%             score_food_1 = score_food_1 - 1;
%         elseif food_surplus1(iDay) > 4*30*food_consumption
%             score_food_1 = score_food_1+1;
%         end
%         
%         if food_surplus2(iDay) <= 4*30*food_consumption && food_surplus2(iDay) > 3*30*food_consumption
%             score_food_2 = score_food_2 + 0.5;
%         elseif food_surplus2(iDay) <= 3*30*food_consumption && food_surplus2(iDay) > 0
%             score_food_2 = score_food_2 + 0.25;
%         elseif food_surplus2(iDay) <= 0
%             score_food_2 = score_food_2 - 1;
%         elseif food_surplus2(iDay) > 4*30*food_consumption
%             score_food_2 = score_food_2+1;
%         end
%         
%         if food_surplus3(iDay) <= 4*30*food_consumption && food_surplus3(iDay) > 3*30*food_consumption
%             score_food_3 = score_food_3 + 0.5;
%         elseif food_surplus3(iDay) <= 3*30*food_consumption && food_surplus3(iDay) > 0
%             score_food_3 = score_food_3 + 0.25;
%         elseif food_surplus3(iDay) <= 0
%             score_food_3 = score_food_3 - 1;
%         elseif food_surplus3(iDay) > 4*30*food_consumption
%             score_food_3 = score_food_3+1;
%         end
%         
%         % water
%         if water_surplus1(iDay) <= 4*30*water_consumption && water_surplus1(iDay) > 3*30*water_consumption
%             score_water_1 = score_water_1 + 0.5;
%         elseif water_surplus1(iDay) <= 3*30*water_consumption && water_surplus1(iDay) > 0
%             score_water_1 = score_water_1 + 0.25;
%         elseif water_surplus1(iDay) <= 0
%             score_water_1 = score_water_1 - 1;
%         elseif water_surplus1(iDay) > 4*30*water_consumption
%             score_water_1 = score_water_1+1;
%         end
%         
%         if water_surplus2(iDay) <= 4*30*water_consumption && water_surplus2(iDay) > 3*30*water_consumption
%             score_water_2 = score_water_2 + 0.5;
%         elseif water_surplus2(iDay) <= 3*30*water_consumption && water_surplus2(iDay) > 0
%             score_water_2 = score_water_2 + 0.25;
%         elseif water_surplus2(iDay) <= 0
%             score_water_2 = score_water_2 - 1;
%         elseif water_surplus2(iDay) > 4*30*water_consumption
%             score_water_2 = score_water_2+1;
%         end
%         
%         if water_surplus3(iDay) <= 4*30*water_consumption && water_surplus3(iDay) > 3*30*water_consumption
%             score_water_3 = score_water_3 + 0.5;
%         elseif water_surplus3(iDay) <= 3*30*water_consumption && water_surplus3(iDay) > 0
%             score_water_3 = score_water_3 + 0.25;
%         elseif water_surplus3(iDay) <= 0
%             score_water_3 = score_water_3 - 1;
%         elseif water_surplus3(iDay) > 4*30*water_consumption
%             score_water_3 = score_water_3+1;
%         end
%         
%         % oxygen
%         if oxygen_surplus1(iDay) <= 4*30*oxygen_consumption && oxygen_surplus1(iDay) > 3*30*oxygen_consumption
%             score_oxygen_1 = score_oxygen_1 + 0.5;
%         elseif oxygen_surplus1(iDay) <= 3*30*oxygen_consumption && oxygen_surplus1(iDay) > 0
%             score_oxygen_1 = score_oxygen_1 + 0.25;
%         elseif oxygen_surplus1(iDay) <= 0
%             score_oxygen_1 = score_oxygen_1 - 1;
%         elseif oxygen_surplus1(iDay) > 4*30*oxygen_consumption
%             score_oxygen_1 = score_oxygen_1+1;
%         end
%         
%         if oxygen_surplus2(iDay) <= 4*30*oxygen_consumption && oxygen_surplus2(iDay) > 3*30*oxygen_consumption
%             score_oxygen_2 = score_oxygen_2 + 0.5;
%         elseif oxygen_surplus2(iDay) <= 3*30*oxygen_consumption && oxygen_surplus2(iDay) > 0
%             score_oxygen_2 = score_oxygen_2 + 0.25;
%         elseif oxygen_surplus2(iDay) <= 0
%             score_oxygen_2 = score_oxygen_2 - 1;
%         elseif oxygen_surplus2(iDay) > 4*30*oxygen_consumption
%             score_oxygen_2 = score_oxygen_2+1;
%         end
%         
%         if oxygen_surplus3(iDay) <= 4*30*oxygen_consumption && oxygen_surplus3(iDay) > 3*30*oxygen_consumption
%             score_oxygen_3 = score_oxygen_3 + 0.5;
%         elseif oxygen_surplus3(iDay) <= 3*30*oxygen_consumption && oxygen_surplus3(iDay) > 0
%             score_oxygen_3 = score_oxygen_3 + 0.25;
%         elseif oxygen_surplus3(iDay) <= 0
%             score_oxygen_3 = score_oxygen_3 - 1;
%         elseif oxygen_surplus3(iDay) > 4*30*oxygen_consumption
%             score_oxygen_3 = score_oxygen_3+1;
%         end
%         
% %         energy
% %         if PowerAvailable1(iDay) <= 4*30*avg_energy_consumption && PowerAvailable1(iDay) > 3*30*avg_energy_consumption
% %             score_energy_1 = score_energy_1 + 0.5;
% %         elseif PowerAvailable1(iDay) <= 3*30*food_consumption && PowerAvailable1(iDay) > 0
% %             score_energy_1 = score_energy_1 + 0.25;
% %         elseif PowerAvailable1(iDay) <= 0
% %             score_energy_1 = score_energy_1 - 1;
% %         elseif PowerAvailable1(iDay) > 4*30*food_consumption
% %             score_energy_1 = score_energy_1+1;
% %         end
% %         
% %         
% %         if PowerAvailable2(iDay) <= 4*30*avg_energy_consumption && PowerAvailable2(iDay) > 3*30*avg_energy_consumption
% %             score_energy_1 = score_energy_1 + 0.5;
% %         elseif PowerAvailable2(iDay) <= 3*30*food_consumption && PowerAvailable2(iDay) >= 0
% %             score_energy_1 = score_energy_1 + 0.25;
% %         elseif PowerAvailable2(iDay) < 0
% %             score_energy_1 = score_energy_1 - 1;
% %         elseif PowerAvailable2(iDay) > 4*30*food_consumption
% %             score_energy_1 = score_energy_1+1;
% %         end
% %         
% %         if PowerAvailable3(iDay) <= 4*30*avg_energy_consumption && PowerAvailable3(iDay) > 3*30*avg_energy_consumption
% %             score_energy_1 = score_energy_1 + 0.5;
% %         elseif PowerAvailable3(iDay) <= 3*30*food_consumption && PowerAvailable3(iDay) >= 0
% %             score_energy_1 = score_energy_1 + 0.25;
% %         elseif PowerAvailable3(iDay) < 0
% %             score_energy_1 = score_energy_1 - 1;
% %         elseif PowerAvailable3(iDay) > 4*30*food_consumption
% %             score_energy_1 = score_energy_1+1;
% %         end
%  
%     end
    
    score_food_1 = food_surplus1(end)/(4*30*food_consumption);
    score_food_2 = food_surplus2(end)/(4*30*food_consumption);
    score_food_3 = food_surplus3(end)/(4*30*food_consumption);
    
    score_water_1 = water_surplus1(end)/(4*30*water_consumption);
    score_water_2 = water_surplus2(end)/(4*30*water_consumption);
    score_water_3 = water_surplus3(end)/(4*30*water_consumption);
    
    score_oxygen_1 = oxygen_surplus1(end)/(4*30*oxygen_consumption);
    score_oxygen_2 = oxygen_surplus2(end)/(4*30*oxygen_consumption);
    score_oxygen_3 = oxygen_surplus3(end)/(4*30*oxygen_consumption);
    
    score_energy_1 = PowerAvailable1(end) / (4*30*avg_energy_consumption);
    
    foodScoreSimulation1(iSimulation) = score_food_1;
    foodScoreSimulation2(iSimulation) = score_food_2;
    foodScoreSimulation3(iSimulation) = score_food_3;
    
    waterScoreSimulation1(iSimulation) = score_water_1; 
    waterScoreSimulation2(iSimulation) = score_water_2; 
    waterScoreSimulation3(iSimulation) = score_water_3; 
    
    oxygenScoreSimulation1(iSimulation) = score_oxygen_1; 
    oxygenScoreSimulation2(iSimulation) = score_oxygen_2;
    oxygenScoreSimulation3(iSimulation) = score_oxygen_3;
    
    energyScoreSimulation1(iSimulation) = score_energy_1; 
    energyScoreSimulation2(iSimulation) = score_energy_1; 
    energyScoreSimulation3(iSimulation) = score_energy_1; 

    disp(['iSimulation', num2str(iSimulation)]);
      
end

totalAvgScore1 = mean(foodScoreSimulation1) + mean(waterScoreSimulation1) ...
    + mean(oxygenScoreSimulation1)+ mean(energyScoreSimulation1);
totalAvgScore2 = mean(foodScoreSimulation2) + mean(waterScoreSimulation2) ...
    + mean(oxygenScoreSimulation2)+ mean(energyScoreSimulation2);
totalAvgScore3 = mean(foodScoreSimulation3) + mean(waterScoreSimulation3) ...
    + mean(oxygenScoreSimulation3)+ mean(energyScoreSimulation3);

averageSim = [mean(foodScoreSimulation1), mean(waterScoreSimulation1), ...
    mean(oxygenScoreSimulation1), mean(energyScoreSimulation1), ...
    totalAvgScore1; ... 
    mean(foodScoreSimulation2), mean(waterScoreSimulation2), ...
    mean(oxygenScoreSimulation2), mean(energyScoreSimulation2), ...
    totalAvgScore2; ...
    mean(foodScoreSimulation3), mean(waterScoreSimulation3), ...
    mean(oxygenScoreSimulation3), mean(energyScoreSimulation3), ...
    totalAvgScore3];

% totalAvgScore1 = mean(foodScoreSimulation1) + mean(waterScoreSimulation1) ...
%     + mean(oxygenScoreSimulation1);
% totalAvgScore2 = mean(foodScoreSimulation2) + mean(waterScoreSimulation2) ...
%     + mean(oxygenScoreSimulation2);
% totalAvgScore3 = mean(foodScoreSimulation3) + mean(waterScoreSimulation3) ...
%     + mean(oxygenScoreSimulation3);
% 
% averageSim = [mean(foodScoreSimulation1), mean(waterScoreSimulation1), ...
%     mean(oxygenScoreSimulation1), totalAvgScore1;  ...
%     mean(foodScoreSimulation2), mean(waterScoreSimulation2), ...
%     mean(oxygenScoreSimulation2), totalAvgScore2; ...
%     mean(foodScoreSimulation3), mean(waterScoreSimulation3), ...
%     mean(oxygenScoreSimulation3), totalAvgScore3];


% x = ['Simulation 1', 'Simulation 2', 'Simulation 3'];
bar(averageSim);

% text(x,averageSim,num2str(y,'%0.2f'),...
%     'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')

title('Average Score by Simulation');
ylabel('Score');
set(gca, 'xticklabel', {'Strategy 1', 'Strategy 2', 'Strategy 3'});
legend('Food', 'Water', 'Oxygen', 'Energy', 'Total', 'Location', 'northeastoutside');
% legend('Food', 'Water', 'Oxygen', 'Total', 'Location', 'northeastoutside');

save('averageSim', 'averageSim');
disp(['averageSim1: ', num2str(averageSim(1,:))]);
disp(['averageSim2: ', num2str(averageSim(2,:))]);
disp(['averageSim3: ', num2str(averageSim(3,:))]);


function numSolarPanels2_Callback(hObject, eventdata, handles)
% hObject    handle to numSolarPanels2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSolarPanels2 as text
%        str2double(get(hObject,'String')) returns contents of numSolarPanels2 as a double


% --- Executes during object creation, after setting all properties.
function numSolarPanels2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSolarPanels2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightOxygen2_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightOxygen2 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightOxygen2 as a double

disp('hi');

% --- Executes during object creation, after setting all properties.
function percentWeightOxygen2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightWater2_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightWater2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightWater2 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightWater2 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightWater2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightWater2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightFood2_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightFood2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightFood2 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightFood2 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightFood2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightFood2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightFood3_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightFood3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightFood3 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightFood3 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightFood3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightFood3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightWater3_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightWater3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightWater3 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightWater3 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightWater3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightWater3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function percentWeightOxygen3_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightOxygen3 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightOxygen3 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightOxygen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numSolarPanels3_Callback(hObject, eventdata, handles)
% hObject    handle to numSolarPanels3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSolarPanels3 as text
%        str2double(get(hObject,'String')) returns contents of numSolarPanels3 as a double


% --- Executes during object creation, after setting all properties.
function numSolarPanels3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSolarPanels3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightFood1_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightFood1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightFood1 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightFood1 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightFood1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightFood1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightWater1_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightWater1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightWater1 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightWater1 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightWater1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightWater1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightOxygen1_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightOxygen1 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightOxygen1 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightOxygen1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightOxygen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numSolarPanels1_Callback(hObject, eventdata, handles)
% hObject    handle to numSolarPanels1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSolarPanels1 as text
%        str2double(get(hObject,'String')) returns contents of numSolarPanels1 as a double


% --- Executes during object creation, after setting all properties.
function numSolarPanels1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSolarPanels1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear VARIABLES
cla();
delete *.mat

handles.percentWeightFood1.String = '0';
handles.percentWeightFood2.String = '0';
handles.percentWeightFood3.String = '0';

handles.percentWeightWater1.String = '0';
handles.percentWeightWater2.String = '0';
handles.percentWeightWater3.String = '0';

handles.percentWeightOxygen1.String = '0';
handles.percentWeightOxygen2.String = '0';
handles.percentWeightOxygen3.String = '0';



function percentWeightHydrogen3_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightHydrogen3 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightHydrogen3 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightHydrogen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightHydrogen2_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightHydrogen2 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightHydrogen2 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightHydrogen2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWeightHydrogen1_Callback(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWeightHydrogen1 as text
%        str2double(get(hObject,'String')) returns contents of percentWeightHydrogen1 as a double


% --- Executes during object creation, after setting all properties.
function percentWeightHydrogen1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWeightHydrogen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

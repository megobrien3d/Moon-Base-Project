function varargout = MoonBaseTool(varargin)
% MOONBASETOOL MATLAB code for MoonBaseTool.fig
%      MOONBASETOOL, by itself, creates a new MOONBASETOOL or raises the existing
%      singleton*.
%
%      H = MOONBASETOOL returns the handle to a new MOONBASETOOL or the handle to
%      the existing singleton*.
%
%      MOONBASETOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOONBASETOOL.M with the given input arguments.
%
%      MOONBASETOOL('Property','Value',...) creates a new MOONBASETOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MoonBaseTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MoonBaseTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MoonBaseTool

% Last Modified by GUIDE v2.5 22-Apr-2017 14:52:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MoonBaseTool_OpeningFcn, ...
                   'gui_OutputFcn',  @MoonBaseTool_OutputFcn, ...
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


% --- Executes just before MoonBaseTool is made visible.
function MoonBaseTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MoonBaseTool (see VARARGIN)

% Choose default command line output for MoonBaseTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MoonBaseTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

delete *.mat
rng('shuffle');

% Choose default command line output for MoonBaseTool
handles.output = hObject;
% create an axes that spans the whole gui

ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes

bg = imread('RocketPic.jpg'); imagesc(bg);

% prevent plotting over the background and turn the axis off

set(ah,'handlevisibility','off','visible','off')

% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');


% --- Outputs from this function are returned to the command line.
function varargout = MoonBaseTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numPeopleText_Callback(hObject, eventdata, handles)
% hObject    handle to numPeopleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numPeopleText as text
%        str2double(get(hObject,'String')) returns contents of numPeopleText as a double


% --- Executes during object creation, after setting all properties.
function numPeopleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numPeopleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentFoodText_Callback(hObject, eventdata, handles)
% hObject    handle to percentFoodText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentFoodText as text
%        str2double(get(hObject,'String')) returns contents of percentFoodText as a double


% --- Executes during object creation, after setting all properties.
function percentFoodText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentFoodText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentWaterText_Callback(hObject, eventdata, handles)
% hObject    handle to percentWaterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentWaterText as text
%        str2double(get(hObject,'String')) returns contents of percentWaterText as a double


% --- Executes during object creation, after setting all properties.
function percentWaterText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentWaterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentOxygenText_Callback(hObject, eventdata, handles)
% hObject    handle to percentOxygenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentOxygenText as text
%        str2double(get(hObject,'String')) returns contents of percentOxygenText as a double


% --- Executes during object creation, after setting all properties.
function percentOxygenText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentOxygenText (see GCBO)
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

handles.numPeopleText.String = num2str(0);
handles.percentFoodText.String = num2str(0);
handles.percentWaterText.String = num2str(0);
handles.percentOxygenText.String = num2str(0);
handles.percentHydrogenText.String = num2str(0);
handles.numSolarPanelsText.String = num2str(0);


% --- Executes on button press in goButton.
function goButton_Callback(hObject, eventdata, handles)
% hObject    handle to goButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num_people = str2double(handles.numPeopleText.String);
food_prop = str2double(handles.percentFoodText.String);
water_prop = str2double(handles.percentWaterText.String);
oxygen_prop = str2double(handles.percentOxygenText.String);

MoonBasePeople = people_gen(num_people);
MoonBasePeople = calories_needs(MoonBasePeople);

% all the initial supplies are in units of kg
tot_cargo_mass = 69853.225;    % in kg

food_mass_density = 105/.149;   % in calories per kg

initial_water = floor(str2double(handles.percentWaterText.String)*tot_cargo_mass*(1/100));
initial_food = floor(str2double(handles.percentFoodText.String)*tot_cargo_mass*food_mass_density*(1/100));
initial_vitamins = num_people*360;  % year's supply
initial_oxygen = floor(str2double(handles.percentOxygenText.String)*tot_cargo_mass*(1/100));
initial_hydrogen = floor(str2double(handles.percentHydrogenText.String)*tot_cargo_mass*(1/100));
num_solar_panels = str2double(handles.numSolarPanelsText.String);


foodMessagesText(1) = cellstr(['Day 1       ' num2str(initial_food) ' calorie influx from rocket.']);
waterMessagesText(1) = cellstr(['Day 1       ' num2str(initial_water) ' kg water influx from rocket.']);
oxygenMessagesText(1) = cellstr(['Day 1       ' num2str(initial_oxygen) ' kg oxygen influx from rocket.']);
energyMessagesText(1) = cellstr(['Day 1       ' num2str(num_solar_panels) ' solar panels influx from rocket.']);
vitaminMessagesText(1) = cellstr(['Day 1       ' num2str(initial_vitamins) ' vitamins influx from rocket.']);

mainMessagesText(1) = cellstr(foodMessagesText(1));
mainMessagesText(2) = cellstr(waterMessagesText(1));
mainMessagesText(3) = cellstr(oxygenMessagesText(1));
allMessages = mainMessagesText;

foodTextColor = [.47, .67, .19];
waterTextColor = [.47, .67, .19];
oxygenTextColor = [.47, .67, .19];
vitaminTextColor = [.47, .67, .19];
energyTextColor = [.47, .67, .19];
fuelTextColor = [.47, .67, .19];

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor'); 

save('Cargo', 'num_people', 'food_prop', 'water_prop', 'oxygen_prop', ...
    'MoonBasePeople', 'initial_vitamins', 'initial_food', ... 
    'initial_water', 'initial_oxygen', 'initial_hydrogen', 'num_solar_panels');

close MoonBaseTool

FoodTool;


function percentHydrogenText_Callback(hObject, eventdata, handles)
% hObject    handle to percentHydrogenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentHydrogenText as text
%        str2double(get(hObject,'String')) returns contents of percentHydrogenText as a double


% --- Executes during object creation, after setting all properties.
function percentHydrogenText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentHydrogenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numSolarPanelsText_Callback(hObject, eventdata, handles)
% hObject    handle to numSolarPanelsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSolarPanelsText as text
%        str2double(get(hObject,'String')) returns contents of numSolarPanelsText as a double


% --- Executes during object creation, after setting all properties.
function numSolarPanelsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSolarPanelsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

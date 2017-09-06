function plotWaterSurplusMultiSim(iDay, MoonBasePeople)
% This function plots the history of the water surplus.
%
%       Author of Original Function: Sarah A Hansen
%       Date: 9 April 2017
%       Modified for MultiSimulationTool by Meg O'Brien on 22 April 2017


%% Parameters
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
end

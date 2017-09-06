function fuelSurplus(handles,num_people,iDay)

load('Cargo');

if iDay == 1
    t(1) = iDay; 
    fuel_surplus(1) = 0;
elseif iDay > 1
    load('plotFuelPoints');
end


UsageGenerate=randi(3);
if UsageGenerate==1
    PowerUse=12.5;
elseif UsageGenerate==2
    PowerUse=13.75;
else
    PowerUse=15;
end
PowerUsed(iDay)=PowerUse*crew;  %Sets total power used for the day
EffGenerate=randi(3);
if EffGenerate==1    %Randomly creates the efficiency of the solar arrays based on ISS data
    Efficiency=0.0336;
elseif EffGenerate==2
    Efficiency=0.0408;
else
    Efficiency=0.048;
end
PanelMeters=10000;
if iDay > 1
    PowerGenerated(iDay)=Efficiency*PanelMeters;    %Sets power generated for a day
    PowerAvailable(iDay)=PowerAvailable(iDay-1)+PowerGenerated(iDay)-PowerUsed(iDay);
    t(iDay)=iDay;
end

save('plotFuelPoints', 't', 'fuel_surplus');

if handles.popUpMenu.Value == 5 && length(t) > 1
    plot(t(2:end), PowerAvailable(2:end), 'b-', t(end), PowerAvailable(end), 'ro');
    xlabel('Day Number');
    ylabel('Power Available (kW)');
    title('Power Available Each Day');
end


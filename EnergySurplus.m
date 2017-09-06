function EnergySurplus(handles,num_people,iDay, PanelMeters)
% PowerAvailable=zeros(1,advanceBy);
% %PowerAvailable(1)=CurrentPower;
% PowerGenerated=zeros(1,advanceBy);
crew=num_people;
% timelength=prevDay+advanceBy;
% t=ones(1,timelength);

if iDay == 1
    t(1) = iDay; 
    PowerAvailable(1) = 0;
    PowerGenerated(1) = 0;
    PowerUsed(1) = 0;
elseif iDay > 1
    load('plotEnergyPoints');
end

%PowerUse = 12.5 + 2.5*rand();


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
% PanelMeters=10000;
if iDay > 1
    PowerGenerated(iDay)=Efficiency*PanelMeters;    %Sets power generated for a day
    PowerAvailable(iDay)=PowerAvailable(iDay-1)+PowerGenerated(iDay)-PowerUsed(iDay);
    t(iDay)=iDay;
end
critical=crew*12.5;
danger=critical*(4/3);
sufficient=critical*3;
MaxCapacity=sufficient*2;

if PowerAvailable(iDay) > MaxCapacity
    PowerAvailable(iDay) = MaxCapacity;
end

save('plotEnergyPoints', 't', 'PowerAvailable', 'PowerGenerated', 'PowerUsed');
if handles.popUpMenu.Value == 5 && length(t) > 1
    plot(t(2:end), PowerAvailable(2:end), 'b-', t(end), PowerAvailable(end), 'ro');
    xlabel('Day Number');
    ylabel('Power Available (kW)');
    title('Power Available Each Day');
    drawnow
end



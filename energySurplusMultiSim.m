function energySurplusMultiSim(iDay, MoonBasePeople, simulationStrategy, num_solar_panels, num_people)

switch simulationStrategy
    case 1
        
        if iDay == 1
            PowerAvailable1(1) = 0;
            save('plotEnergyPoints1', 'PowerAvailable1');
            
        elseif iDay > 1
            load('plotEnergyPoints1');
            
            crew=num_people;
            
            PowerUse = 12.5 + 2.5*rand();
            
            PowerUsed1=PowerUse*crew;  %Sets total power used for the day
            
            EffGenerate=randi(3);
            if EffGenerate==1    %Randomly creates the efficiency of the solar arrays based on ISS data
                Efficiency=0.0336;
            elseif EffGenerate==2
                Efficiency=0.0408;
            else
                Efficiency=0.048;
            end
            
            PanelMeters=num_solar_panels;
            
            PowerGenerated1=Efficiency*PanelMeters;    %Sets power generated for a day
            PowerAvailable1(iDay)=PowerAvailable1(iDay-1)+PowerGenerated1-PowerUsed1;
            
            save('plotEnergyPoints1', 'PowerAvailable1');
        end
        
    case 2
        
        if iDay == 1
            PowerAvailable2(1) = 0;
            save('plotEnergyPoints2', 'PowerAvailable2');
            
        elseif iDay > 1
            load('plotEnergyPoints2');
            
            crew=num_people;
            
            PowerUse = 12.5 + 2.5*rand();
            
            PowerUsed2=PowerUse*crew;  %Sets total power used for the day
            
            EffGenerate=randi(3);
            if EffGenerate== 1   %Randomly creates the efficiency of the solar arrays based on ISS data
                Efficiency=0.0336;
            elseif EffGenerate==2
                Efficiency=0.0408;
            else
                Efficiency=0.048;
            end
            
            PanelMeters=num_solar_panels;
            
            PowerGenerated2=Efficiency*PanelMeters;    %Sets power generated for a day
            PowerAvailable2(iDay)=PowerAvailable2(iDay-1)+PowerGenerated2-PowerUsed2;
            
            save('plotEnergyPoints2', 'PowerAvailable2');
        end
        
    case 3
        
        if iDay == 1
            PowerAvailable3(1) = 0;
            save('plotEnergyPoints3', 'PowerAvailable3');
            
        elseif iDay > 1
            load('plotEnergyPoints3');
            
            crew=num_people;
            
            PowerUse = 12.5 + 2.5*rand();
            
            PowerUsed3=PowerUse*crew;  %Sets total power used for the day
            
            EffGenerate=randi(3);
            if EffGenerate== 1   %Randomly creates the efficiency of the solar arrays based on ISS data
                Efficiency=0.0336;
            elseif EffGenerate==2
                Efficiency=0.0408;
            else
                Efficiency=0.048;
            end
            
            PanelMeters=num_solar_panels;
            
            PowerGenerated3=Efficiency*PanelMeters;    %Sets power generated for a day
            PowerAvailable3(iDay)=PowerAvailable3(iDay-1)+PowerGenerated3-PowerUsed3;
            
            save('plotEnergyPoints3', 'PowerAvailable3');
        end
        
end

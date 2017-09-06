function oxygenSurplusMultiSim(iDay, MoonBasePeople, simulationStrategy, initial_oxygen, initial_hydrogen, num_people)

switch simulationStrategy
    case 1
        
        if iDay == 1
            oxygen_surplus1(iDay) = initial_oxygen;
            save('plotOxygenPoints1', 'oxygen_surplus1');
        elseif iDay ~= 1
            load('plotOxygenPoints1');
            
            oxygenConsumption = DaysOxygenConsumption(MoonBasePeople);
            oxygen_production = oxygenProductionMultiSim(num_people, initial_hydrogen);
            
            oxygen_surplus1(iDay) = oxygen_surplus1(iDay-1) + oxygen_production - oxygenConsumption;
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                oxygen_surplus1(iDay) = oxygen_surplus1(iDay) + oxygen_surplus1(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            save('plotOxygenPoints1', 'oxygen_surplus1');
        end
        
    case 2
        
        if iDay == 1
            oxygen_surplus2(iDay) = initial_oxygen;
            save('plotOxygenPoints2', 'oxygen_surplus2');
        elseif iDay ~= 1
            load('plotOxygenPoints2');
            
            oxygenConsumption = DaysOxygenConsumption(MoonBasePeople);
            oxygen_production = oxygenProductionMultiSim(num_people, initial_hydrogen);
            
            oxygen_surplus2(iDay) = oxygen_surplus2(iDay-1) + oxygen_production - oxygenConsumption;
            
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                oxygen_surplus2(iDay) = oxygen_surplus2(iDay) + oxygen_surplus2(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            
            save('plotOxygenPoints2', 'oxygen_surplus2');
        end
        
    case 3
        
        if iDay == 1
            oxygen_surplus3(iDay) = initial_oxygen;
            save('plotOxygenPoints3', 'oxygen_surplus3');
        elseif iDay ~= 1
            load('plotOxygenPoints3');
            
            oxygenConsumption = DaysOxygenConsumption(MoonBasePeople);
            oxygen_production = oxygenProductionMultiSim(num_people, initial_hydrogen);
            
            oxygen_surplus3(iDay) = oxygen_surplus3(iDay-1) + oxygen_production - oxygenConsumption;
            
            
            if iDay == 360 || iDay == 2*360 || iDay == 3*360 || iDay == 4*360 ...
                    || iDay == 5*360 || iDay == 6*360 || iDay == 7*360 || ...
                    iDay == 8*360 || iDay == 9*360 || iDay == 10*360
                oxygen_surplus3(iDay) = oxygen_surplus3(iDay) + oxygen_surplus3(1);   % corresponds to adding initial food again because replenished by rocket
            end
            
            
            save('plotOxygenPoints3', 'oxygen_surplus3');
        end
        
end

function oxygen_production = oxygenProductionMultiSim(num_people, initial_hydrogen)
% This function uses the results of Allen, et al. in order to determine the
% amount of oxygen produced from a given amount of soil harvested. It
% randomizes the weight perfect of iron II oxide in the soil and from this
% uses the linear fit given by Allen, et al. in order to calculate the
% weight percent of oxygen produced.
%
% This has been modified from function oxygenProduction to accomodate the
% MultiSimulationTool.
%
%   Author: Meg O'Brien
%   Date: April 24, 2017

weight_percent_iron2 = 18.02+4.88*rand();
weight_percent_oxygen = .19*weight_percent_iron2+0.55;

soil_harvested_in_day = 0.25*num_people;   % kg soil harvested per person; number is an assumption

molar_mass_h2 = 2*1.00794*(1/1000);   % molar mass in kg
stoichiometric_ratio_o2_to_h2 = 1/2;
molar_mass_o2 = 16*2*(1/1000);  % molar mass in kg

max_possible_produced_oxygen = initial_hydrogen*(1/molar_mass_h2)*...
    stoichiometric_ratio_o2_to_h2*molar_mass_o2; % based on amount of Hydrogen that is initially sent up

oxygen_production = min(soil_harvested_in_day*weight_percent_oxygen, max_possible_produced_oxygen);

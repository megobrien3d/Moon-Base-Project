function water_production = waterProduction(dayNumber) 

load('Cargo', 'MoonBasePeople');

water_production_from_ice_per_person = 2.5*length(MoonBasePeople); % kg/day from moon ice
water_production=(.93)*DaysWaterConsumption(MoonBasePeople)+water_production_from_ice_per_person;
function water_production = waterProductionMultiSim(MoonBasePeople) 

water_production_from_ice_per_person = 3.5; % kg/day from moon ice
water_production=(.93)*DaysWaterConsumption(MoonBasePeople)+water_production_from_ice_per_person;
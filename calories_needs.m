function myPeople = calories_needs(myPeople)
% This function takes the age, height, gender, and job of each person in 
% the myPeople struct and determines their activity level, as well as their
% calorie consumption using the Harris-Benedict equation.
%
        % Author: Meg O'Brien
        % Updated April 22, 2017
 
people_num = length(myPeople);

for ipeople=1:people_num
    gender = myPeople(ipeople).gender;
    height = myPeople(ipeople).height;
    age = myPeople(ipeople).age;
    weight = myPeople(ipeople).weight;
    
    switch gender
        case 'male'
            BMR = 10*weight+6.25*height-5*age+5;
        case 'female'
            BMR = 10*weight+6.25*height-5*age-161;      
    end
    
    job = myPeople(ipeople).job;
    switch job
        case 'doctor'
            activity_level = 1.2;   % corresponds to little or no exercise
        case 'grower'
            activity_level = 1.725;   % corresponds to heavy exercise
        case 'engineer'
            activity_level = 1.55;    % corresponds to moderate exercise
    end      
    
    calories_needed = floor(BMR*activity_level)+1; % rounds up to nearest calorie
    
    myPeople(ipeople).calorie_needs = calories_needed;
    
    oxygen_needed = (calories_needed*6*0.032)/(686);  % using stoichiometry ...
    % to find the O2 consumption per person. Assumes all calories are
    % from glucose.
    
    myPeople(ipeople).oxygen_needs = oxygen_needed;

end



score_food_2 = 0;

load('plotFoodPoints2');

MoonBasePeople = people_gen(20);
MoonBasePeople = calories_needs(MoonBasePeople);

food_consumption = DaysFoodConsumption(MoonBasePeople);


for iDay=2:length(food_surplus2)

if food_surplus2(iDay) <= 4*30*food_consumption && food_surplus2(iDay) > 3*30*food_consumption
            score_food_2 = score_food_2 + 0.5;
        elseif food_surplus2(iDay) <= 3*30*food_consumption && food_surplus2(iDay) > 0
            score_food_2 = score_food_2 + 0.25;
        elseif food_surplus2(iDay) <= 0
            score_food_2 = score_food_2 - 1;
        elseif food_surplus2(iDay) > 4*30*food_consumption
            score_food_2 = score_food_2+1;
end
end
        
disp(score_food_2);

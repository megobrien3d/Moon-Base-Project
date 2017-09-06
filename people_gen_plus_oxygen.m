function myPeople = people_gen_plus_oxygen(N)
%   This function randomly generates N people with random genders and
%   heights/weight. It also assigns them a job in the specified proportion.
%
%   This function uses the height, weight, and gender of each person to
%   calculate their individual caloric needs.

for ipeople=1:N
    gender_num = randi([0,1]);
    age = randi([26, 46]);  % age range of astronauts
    bmi = rand()/6.4 + 18.5; % generate random healthy bmi for astronauts to calculate weight later
    
    switch gender_num
        case 0
            gender_word = 'female';
            
            if age >= 20 && age <= 29
                mu = 162.9;    % average height in inches for American women in this age group
                sigma = 0.30;     % standard deviation of height of American women in this age group
            elseif age >= 30 && age <= 39
                mu = 163.4;
                sigma = 0.30;
            elseif age >= 40 && age <= 49
                mu = 162.9;
                sigma = .31;
            end
            
        case 1
            gender_word = 'male';
            
            if age >= 20 && age <= 29
                mu = 176.4;    % average height in inches for American men in this age group
                sigma = 0.26;     % standard deviation of height of American men in this age group
            elseif age >= 30 && age <= 39
                mu = 176.6;
                sigma = 0.30;
            elseif age >= 40 && age <= 49
                mu = 176.2;
                sigma = .42;
            end
            
    end
    
    height = normrnd(mu, sigma);
    if height >= 157.48 && height <= 190.5   % height requirement for astronauts
        in_range = true;
    end
    
    while ~in_range
        height = normrnd(mu, sigma);
    end
    
    weight = bmi*(height/100).^2;  % calculate weight from height and bmi
    
    myPeople(ipeople).gender = gender_word;
    myPeople(ipeople).age = age;          % in years
    myPeople(ipeople).height = height;    % in cm
    myPeople(ipeople).weight = weight;    % in kg
end


%% Jobs assignment: This section assigns a job to each person in the
% proper proportion of jobs necessary.

% Proportion of jobs desired
doctor_prop = 0.03;
grower_prop = 0.3;
engineer_prop = 0.67;

% Generation of array of jobs based on desired proportions above
jobs_num = length(myPeople);
num_doctors = floor(doctor_prop*jobs_num);
num_growers = floor(grower_prop*jobs_num);
num_engineers = floor(engineer_prop*jobs_num);

while (num_doctors+num_growers+num_engineers) < jobs_num
    num_doctors = num_doctors + 1;
end

myJobs = [];   % creates empty array myJobs

for ijobs=1:jobs_num
    job_added = false;
    
    while nnz(myJobs==1) < num_doctors && ijobs <= num_doctors && ~job_added
        myJobs(ijobs) = 1; % array of jobs is myArray; 1 is for doctor
        job_added = true;
    end
    
    while nnz(myJobs==2) < num_growers && ijobs <= (num_doctors+num_growers) && ~job_added
        myJobs(ijobs) = 2;    % 2 is for grower
        job_added = true;
    end
    
    while nnz(myJobs==3) < num_engineers && ijobs <= (num_doctors+num_growers+num_engineers) && ~job_added
        myJobs(ijobs) = 3;      % 3 is for engineer
        job_added = true;
    end
end


% Assigns jobs to each person randomly
for ipeople=1:jobs_num
    job_index = randi([1, length(myJobs)]);
    job_number_representation = myJobs(job_index);
    
    switch job_number_representation
        case 1
            job_name = 'doctor';
            
        case 2
            job_name = 'grower';
            
        case 3
            job_name = 'engineer';
    end
    
    myPeople(ipeople).job = job_name;
    
    myJobs = myJobs([1:(job_index-1), (job_index+1):end]);
    
end

% Assigns calorie and oxygen needs for each person
for ipeople=1:N
    myPeople(ipeople).calorie_needs=calories_needs(myPeople(ipeople));
    myPeople(ipeople).oxygen_needs=oxygen_needs(myPeople(ipeople));
end
end

function myPeople = job_selector(myPeople)
%   This function takes the myPeople structure and adds a field called
%   "jobs" and assigns a job to each person in the proper proportion of
%   jobs necessary. 

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
    




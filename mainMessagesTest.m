function y = mainMessagesTest()
% This function orders all the messages to be displayed to the Main Menu. 
% Author: Meg O'Brien
% Date: April 18, 2017

load('messages');

allMessages = horzcat(foodMessagesText, vitaminMessagesText, ... 
    waterMessagesText, oxygenMessagesText, energyMessagesText);

% allMessages = horzcat(foodMessagesText, waterMessagesText, ...
% oxygenMessagesText, energyMessagesText, fuelMessagesText);

swaps = true;

while swaps
    swaps = false;
    for index=1:length(allMessages)-1
        disp(['index: ' num2str(index)]);
        
        message1 = cell2mat(allMessages(index));
        comparePortion1 = message1(5:12); 
        
        disp(comparePortion1);
        
        message2 = cell2mat(allMessages(index+1));
        comparePortion2 = message2(5:12);
        
        disp(comparePortion2);
        
        if str2double(comparePortion1) > str2double(comparePortion2)
            allMessages(index) = cellstr(message2);
            allMessages(index+1) = cellstr(message1);
            swaps = true;
        end
         
    end
end

y = allMessages;




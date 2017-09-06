function mainMessages(handles)
% This function orders all the messages to be displayed to the Main Menu. 
% Author: Meg O'Brien
% Date: April 18, 2017

load('messages');

allMessages = horzcat(foodMessagesText, vitaminMessagesText, ... 
    waterMessagesText, oxygenMessagesText, energyMessagesText);

swaps = true;

while swaps
    swaps = false;
    for index=1:length(allMessages)-1
        message1 = cell2mat(allMessages(index));
        comparePortion1 = message1(5:12); 
        message2 = cell2mat(allMessages(index+1));
        comparePortion2 = message2(5:12);
        
        if str2double(comparePortion1) > str2double(comparePortion2)
            allMessages(index) = cellstr(message2);
            allMessages(index+1) = cellstr(message1);
            swaps = true;
        end
         
    end
end

if handles.popUpMenu.Value == 1
    
    handles.dText1.BackgroundColor = oxygenTextColor;
    handles.dText2.BackgroundColor = energyTextColor;
    handles.dText4.BackgroundColor = foodTextColor;
    handles.dText5.BackgroundColor = vitaminTextColor;
    handles.dText6.BackgroundColor = waterTextColor;
    
    if length(allMessages) > 10
        handles.messagesText.String = allMessages((length(allMessages)-9):end);
    else
        handles.messagesText.String = allMessages;
    end
end

save('messages', 'foodMessagesText', 'foodTextColor', 'energyMessagesText', ...
    'waterMessagesText', 'waterTextColor','oxygenMessagesText', ...
    'mainMessagesText', 'allMessages',  'vitaminTextColor', 'vitaminMessagesText', ...
    'oxygenTextColor', 'energyTextColor', 'fuelTextColor');

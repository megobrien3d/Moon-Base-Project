function scrollMessages(messages, messagesIndex, isUp, handles)
% Function makese the messages scroll up in the GUI. 
%       Author: Meg O'Brien
%       Date: April 23, 2017

if isUp && messagesIndex > 1
    messagesIndex = messagesIndex - 1;
    
    if length(messages)+1-messagesIndex >= 10
        handles.messagesText.String = messages(messagesIndex:(messagesIndex+9));
    else
        handles.messagesText.String = messages(messagesIndex:end);
    end
    
    save('messagesIndex', 'messagesIndex');
    
elseif ~isUp && messagesIndex < length(messages)
    messagesIndex = messagesIndex + 1; 
    
    if length(messages)+1-messagesIndex <= 10
        handles.messagesText.String = messages(messagesIndex:end);
    else
        handles.messagesText.String = messages(messagesIndex:(messagesIndex+9));
    end
    
    save('messagesIndex', 'messagesIndex');
end




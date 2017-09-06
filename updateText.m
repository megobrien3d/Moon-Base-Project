function updateText(handles)
%    This function updates the text box in the GUI based on the option
%    selected by the pop-up menu.

load('messages');


if handles.popUpMenu.Value == 1
    %
    
elseif handles.popUpMenu.Value == 2
    
    handles.messagesText.String = foodMessagesText;
    
elseif handles.popUpMenu.Value == 3
    handles.messagesText.String = waterMessagesText;
    
elseif handles.popUpMenu.Value == 4
    handles.messagesText.String = oxygenMessagesText;
    
elseif handles.popUpMenu.Value == 5
    handles.messagesText.String = energyMessagesText;
%     
% elseif handles.popUpMenu.Value == 6
%     handles.messagesText.String = fuelMessagesText;
end
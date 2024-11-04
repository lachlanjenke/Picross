%Rounds mouse input values
function [rowCord,columnCord] = roundMouseCords(rowCord,columnCord)
    columnCord2 = mod(columnCord,1); %Gives just the decimal 
    rowCord2 = mod(rowCord,1); %Gives just the decimal
    if columnCord2 >= 0.5 %If decimal higher than or equal to 0.5
        columnCord = ceil(columnCord); %Then round it up
    else 
        columnCord = floor(columnCord); %Otherwise round down
    end 
    if rowCord2 >= 0.5 %If decimal higher than or equal to 0.5
        rowCord = ceil(rowCord); %Round it up
    else 
        rowCord = floor(rowCord); %Round it down
    end 
end 
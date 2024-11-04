%Displaying the values
function [correctTiles,correctAns] = dispValues(boardSize,ansBoard, ...
    al,activeBoard)
%Initialising variables 
rowIndex = 1;
columnIndex = 1;
%Initialing vectors. The size is larger than the amount of integers 
%that will be placed into them. 
rowVals = zeros(1,boardSize);
columnVals = zeros(1,boardSize);
hold on

%Counting the values 
for j = 1:boardSize
    for i = 1:boardSize 
         if ansBoard(j,i) == 0 %If value = 0 count it 
             rowVals(rowIndex) = rowVals(rowIndex) + 1; 
         else %If value = 1 don't count and move to the next element 
            rowIndex = rowIndex + 1; %
         end 
         if ansBoard (i,j) == 0 %If value = 0 count it
             columnVals(columnIndex) = columnVals(columnIndex) + 1;
         else %If value = 1 don't count and move to the next element 
             columnIndex = columnIndex + 1;
         end 
    end 
    
    rowIndex = 1; %Reset the variable 
    %Condenses the vector so it contains only the counted values
    rowVals(rowVals==0) = [];  
    rowVals = int2str(rowVals); %Convert vector to characters
    %The values of the vector are displayed horizontally
    text(0.7,j+al,rowVals,'fontSize',10,'color','k', ...
        'FontWeight','bold'); 
    rowVals = zeros(1,boardSize); %Reset the vector

    columnIndex = 1; %Reset the variable
    columnVals(columnVals==0) = []; %Condeses the vector
    columnVals = string(columnVals); %Converts vector to string
    %Dislays the values vertically
    if al >= 2 
        height = al-ceil(((1/al)/2)*2)+0.5; 
    else 
        height = 1; 
    end 
    text(j+al,height,columnVals,'FontSize',10,'Color','k', ...
        'FontWeight','bold');
    columnVals = zeros(1,boardSize); %Resets the vector

 
end 
hold off

%Counting the correct number for tiles
correctTiles = 0; 
for rowsLoop = 1:boardSize
    for colsLoop = 1:boardSize
        if ansBoard(rowsLoop,colsLoop) == 0
            correctTiles = correctTiles + 1;
        end 
    end 
end 

%Counting the correct number of tiles in the active board 
correctAns = 0;  
for rowsLoop = 1:boardSize
    for colsLoop = 1:boardSize
        if activeBoard(rowsLoop+al,colsLoop+al) == 0
            correctAns = correctAns + 1;
        end 
    end 
end 

end 
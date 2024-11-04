%Coding Picross 

clc %Cleaning up
set(0,'DefaultFigureWindowStyle','docked'); %Docks figures in matlab 

%Initialising the games variables 
win = 0;  
rowAns = 0;
colAns = 0;
incorrectAns = 0; 
%Defines the colours for the intro and main board
colourMap = [0.4 0.6 0.9; 1 1 1;0.9 1 0.9;0.9 0.9 0.9;1 0.5 0.5]; 
introColourMap = [1 1 1; 0.4 0.6 0.9; 0.9 0.9 0.9;1 0.5 0.5];

%Defines the colour maps for the victory animation
red = [1 0.5 0.5;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
orange = [1 0.6 0.3;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
yellow = [1 0.9 0.3;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
green = [0.5 1 0.5;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
blue = [0.4 0.6 0.9;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
pink = [1 0.8 1;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
purple = [0.6 0.5 1;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];
black = [0 0 0;1 1 1;1 1 1;0.9 0.9 0.9;1 1 1];

% =======================================================================
%Intro
%Matrix for intro board
introBoard = [0 0 0 0; 0 0 0 0; 0 1 2 0; 0 1 1 0; 0 0 0 0]; 
introBoard = ind2rgb(introBoard+1,introColourMap); %Convert to colours
imshow(introBoard,'InitialMagnification','fit') %Show the board
figure(1); 

hold on %Allow for updates
%Create a rectangle around the intro board and around the mini game board
rectangle('Position',[0.5 0.5 4 5 ],'LineWidth',2,'EdgeColor','k');
rectangle('Position',[1.5 2.5 2 2 ],'LineWidth',2,'EdgeColor','k');

%Points for the mini game grid
x1 = [2.5 2.5];
y1 = [2.5 4.5]; 
x2 = [1.5 3.5]; 
y2 = [3.5 3.5];

%Plot the grid
plot(x1,y1,'LineWidth',2,'Color','k'); 
plot(x2,y2,'LineWidth',2,'Color','k');

 text(2.5,1,'P I C R O S S','FontSize',30,'Color','k', ...
 'HorizontalAlignment','center'); %Displays the games name
%Diplays the values around the mini board
text(2,2,'2','FontSize',10,'Color','k'); 
text(3,2,'1','FontSize',10,'Color','k'); 
text(1,3,'1','FontSize',10,'Color','k'); 
text(1,4,'2','FontSize',10,'Color','k'); 

hold off 

%Ask if the user would like to view the tutorial 
tutorial = input('Would you like to view the tutorial? Y or N: ','s');

%Checking if reply is valid
while strcmp(tutorial,'Y') == 0 && strcmp(tutorial,'N') == 0
    tutorial = input('Y or N: ','s');
end  


if strcmp('Y',tutorial) == 1 
    %Rule page 1 
    %Generate the slide
    slide1 = [0 0 0 0 0 0 0; 0 1 1 2 1 2 0; 0 0 0 0 0 0 0]; 
    slide1 = ind2rgb(slide1+1,introColourMap); %Convert to colour
    imshow(slide1,'InitialMagnification','fit'); %Show
    hold on
    %Draw rectangles
    rectangle('Position',[0.5 0.5 7 3 ],'LineWidth',2,'EdgeColor','k');
    rectangle('Position',[1.5 1.5 5 1 ],'LineWidth',2,'EdgeColor','k');
    %Draw mini grid
    for i1 = 2.5:5.5
        x3 = [i1 i1];
        y3 = [1.5 2.5];
        plot(x3,y3,'Color','k','LineWidth',2);
    end 
    %Displaying the text
    text(0.7,0.7,'How to play:','FontSize',20,'Color','k');
    text(1,2,'2  1','FontSize',20,'Color','k');
    text(2,1.3,'1','FontSize',20,'Color','k');
    text(3,1.3,'1','FontSize',20,'Color','k');
    text(5,1.3,'1','FontSize',20,'Color','k');
    rules1 = text(4, 3,['After selecting a board size values will appear ' ...
        'around the left and top of the board'],'FontSize',15, ...
        'Color','k','HorizontalAlignment','center');
    pause(3); %Give time for user to read
    delete(rules1); %Removes text so next rule can be shown
    rules2 = text(4, 3,['e.g 2, 2 1 etc. They determine how many correct ' ...
        'tiles are in a row or column'],'FontSize',15, ...
        'Color','k','HorizontalAlignment','center');
    pause(3); 
    delete(rules2); 
    rules3 = text(4,3,['If the values were 2 1 it means somewhere in the ' ...
        'board in that row or column there are'],'FontSize', ...
        15,'Color','k','HorizontalAlignment','center');
    rules4 = text(4,3.3,['2 correct tiles in a row followed by a ' ...
        'gap of at least 1 tile, and then another 1 correct tile'], ...
        'FontSize',15, 'Color','k','HorizontalAlignment','center');
    pause(5);
    delete(rules3);
    delete(rules4);
    hold off
    
    %Slide 2
    %Generate the slide
    slide2 = [0 0 0 0 0 0 0; 0 1 0 2 0 3 0; 0 0 0 0 0 0 0];
    slide2 = ind2rgb(slide2+1,introColourMap); %Convert to colour
    imshow(slide2,'InitialMagnification','fit'); %Show
    
    hold on
    
    %Draw rectangles
    rectangle('Position',[0.5 0.5 7 3 ],'LineWidth',2,'EdgeColor','k');
    rectangle('Position',[1.5 1.5 1 1 ],'LineWidth',2,'EdgeColor','k');
    rectangle('Position',[3.5 1.5 1 1 ],'LineWidth',2,'EdgeColor','k');
    rectangle('Position',[5.5 1.5 1 1 ],'LineWidth',2,'EdgeColor','k');
    
    %Displaying text
    text(0.7,0.7,'How to play:','FontSize',20,'Color','k');
    rules5 = text(4,3,['To select a tile type in a row and then ' ...
        'a column or left click. The selected tile will turn blue'], ...
        'FontSize',15,'Color','k','HorizontalAlignment','center'); 
    upArrow = text(2,2.7,'\uparrow','Color','k','FontSize',25,'FontWeight' ...
        ,'bold'); %Creates an arrow
    pause(3); 
    delete(rules5); 
    delete(upArrow); %Deletes arrow 
    rules6 = text(4,3,['To mark a tile you know is incorrect, ' ...
        'type in the row and/or column as a negative value or right click'], ...
        'FontSize',14,'Color','k','HorizontalAlignment','center'); 
    rules7 = text(4,3.3,['This will turn the tile grey. If the tile was ' ...
        'correct it will turn blue and be counted as a mistake'], ...
        'FontSize',14,'Color','k','HorizontalAlignment','center'); 
    upArrow = text(4,2.7,'\uparrow','Color','k','FontSize',25,'FontWeight' ...
        ,'bold'); 
    pause(5); 
    delete(rules6); 
    delete(rules7);
    delete(upArrow);
    rules8 = text(4,3,['If you make a guess and it is incorrect ' ...
        'the tile will turn red and it will count as a mistake.'], ...
        'FontSize',15,'Color','k','HorizontalAlignment','center'); 
    upArrow = text(6,2.7,'\uparrow','Color','k','FontSize',25,'FontWeight' ...
        ,'bold'); 
    pause(3); 
    delete(rules8); 
    delete(upArrow);
    
    hold off
    
    %Ready to play
    slide3 = [1 0 0 0 0 0 1; 2 0 0 0 0 0 2; 3 0 0 0 0 0 3]; 
    slide3 = ind2rgb(slide3+1,introColourMap); 
    imshow(slide3,'InitialMagnification','fit');
    hold on
    %Display the rectangles
    rectangle('Position',[0.5 0.5 7 3],'LineWidth',2,'EdgeColor','k');
    for r = 0.5:2.5
    rectangle('Position',[0.5 r 1 1],'LineWidth',2,'EdgeColor','k');
    rectangle('Position',[6.5 r 1 1],'LineWidth',2,'EdgeColor','k');
    end 
    
    %Display text
    text(4,1,'You are now ready to play!','FontSize',30, ...
        'Color','k','HorizontalAlignment','center');
    text(4,2,'Select mouse (1) or keyboard (2) and','FontSize', ...
        20,'Color','k','HorizontalAlignment','center');
    text(4,2.4,'enter a board size below to begin','FontSize',20, ...
        'Color','k','HorizontalAlignment','center');   
    text(4,3,'(Board sizes can range from 5 to 10)','FontSize',20, ...
        'Color','b','HorizontalAlignment','center');
    hold off
end 

%Keyboard or mouse
userInput = input('Type 1 for mouse or 2 for keyboard: ');
while userInput <= 0 || userInput > 2
userInput = input('Type 1 for mouse or 2 for keyboard: ');
end 

%Generates the boards
boardSize = input('Please input a board size between 5-10 (As a postive integer): '); 
while boardSize < 5 || rem(boardSize,1) ~= 0 || boardSize > 10
boardSize = input(['Please input a valid board size between 5-10 (As a postive ' ...
    'integer): ']); 
end 
ansBoard = randi([0,1],boardSize); %Generate the solution


%Al (alignment) is used to align certain parts of the board properly for
%different board sizes (like text or room for the boards values)

if boardSize >= 10
    al = 2;
else
    al = 1;
end 
activeBoard = ones(boardSize+(al+1)); %Generates the visible board
 

%Calling the functions needed to display the game
dispBoard(activeBoard,colourMap); %Displays the board
hold on
dispGrid(boardSize,al); %Displays the grid (Change name)

[correctTiles,correctAns] = dispValues(boardSize,ansBoard,al,activeBoard); 
%Displays gui
[progress] = dispGui(correctTiles,incorrectAns,correctAns,boardSize,al); 

% ========================================================================
%Running the game

while win == 0 
    hold on

    if userInput == 2 %Use keyboard for input
        rowCord = input("Select a row: "); %Prompts user for a row
    
        %Check if the column is valid for the boardsize
        while rowCord > boardSize || rowCord < -(boardSize) || rowCord == 0 
               rowCord = input("Please select a valid row: ");
        end 
    
        %Highlights the row the user has selected 
        for rowColour = 1:boardSize
            %If tile is white / = 1 change to green
            if activeBoard(abs(rowCord) + al,rowColour + al) == 1   
            activeBoard(abs(rowCord) + al,rowColour + al) = 2; 
            end 
        end 
        
        %Updates the board
        dispBoard(activeBoard,colourMap); 
        dispGrid(boardSize,al); 
        [correctTiles,correctAns] = dispValues(boardSize,ansBoard,al ...
            ,activeBoard); 
        dispGui(correctTiles,incorrectAns,correctAns,boardSize,al);
    
        columnCord = input("Select a column: ");%Prompts user for a column
    
        %Check if the column is valid for the boardsize
        while columnCord > boardSize || columnCord < -(boardSize) ... 
            || columnCord == 0
            columnCord = input("Please select a valid column: ");
        end 
    
    
        %Unhighlights the board
        for rowColour = 1:boardSize
            %If tiles green / = 2 change back to white
            if activeBoard(abs(rowCord) + al,rowColour + al) == 2
            activeBoard(abs(rowCord) + al,rowColour + al) = 1; 
            end 
        end 
    end 

    
    if userInput == 1 %Use mouse for inout
        [columnCord, rowCord,button] = ginput(1); 
        
        [rowCord,columnCord] = roundMouseCords(rowCord,columnCord); 

        while rowCord > (boardSize + al) || rowCord <= al || ...
            columnCord > (boardSize+al) || columnCord <= al
            [columnCord, rowCord,button] = ginput(1); 
            [rowCord,columnCord] = roundMouseCords(rowCord,columnCord);
        end 

        if button == 1
         activeBoard(rowCord,columnCord) = 0; 
        else 
         activeBoard(rowCord,columnCord) = 3; 
        end 
    end 


    %Update the board
    dispBoard(activeBoard,colourMap);
    dispGrid(boardSize,al); 
    [correctTiles,correctAns] = dispValues(boardSize,ansBoard,al, ...
        activeBoard); 
    dispGui(correctTiles,incorrectAns,correctAns,boardSize,al);
   
    
   %Changes the value of the inputed tile (when keyboard selected)
   if userInput == 2 
       if rowCord > 0 && columnCord > 0 
       activeBoard(rowCord+al,columnCord+al) = 0; 
       else %Allows the user to mark a tile as incorrect if value negative
           %If tile is actually correct
           if  ansBoard(abs(rowCord),abs(columnCord)) == 0
               %Display as correct but is a mistake
               activeBoard(abs(rowCord)+al,abs(columnCord)+ ...
                   al) = 0; 
               incorrectAns = incorrectAns + 1; 
           else %If tile is incorrect then mark as red
           activeBoard(abs(rowCord)+al,abs(columnCord)+al) = 3; 
           end 
       end 
       
       %Checking if input is correct (for keyboard)
       if activeBoard(abs(rowCord)+al,abs(columnCord)+al)...
               == ansBoard(abs(rowCord),abs(columnCord)) %If correct
        %If tile has been marked as incorrect by user do nothing
       elseif activeBoard(abs(rowCord)+al,abs(columnCord) ...
               +al) == 3 
       else %If wrong change tile to red
         incorrectAns = incorrectAns + 1; 
         activeBoard(abs(rowCord)+al,abs(columnCord)+al)...
         = 4; 
       end 
   end 
    
   %Changes the value of the inputed tile (when mouse selected)
   if userInput == 1
     %If activeBoard is the same as answer board...
     if  activeBoard(rowCord,columnCord) == ansBoard(rowCord - al, ...
             columnCord-al) 
         activeBoard(rowCord,columnCord) = 0; %... Make blue
     elseif activeBoard(rowCord,columnCord) == 3 %If marked grey... 
         if ansBoard(rowCord-al,columnCord-al) == 1 
             activeBoard(rowCord,columnCord) = 3; %If tile is incorrect
         else
             %If tile was correct
             activeBoard(rowCord,columnCord) = 0; 
             incorrectAns = incorrectAns + 1; 
         end
     else %If tile is incorrect...
         activeBoard(rowCord,columnCord) = 4;
         incorrectAns = incorrectAns + 1; %... Make red
     end 
   end 

   %Updating the board
   dispBoard(activeBoard,colourMap)
   dispGrid(boardSize,al); 
   [correctTiles,correctAns] = dispValues(boardSize,ansBoard,al,activeBoard); 
   [progress] = dispGui(correctTiles,incorrectAns,correctAns,boardSize,al);

   %If all correct tiles have been selected en
   if correctAns == correctTiles 
       win = 1; 
       clc 
   end 

end 

% ========================================================================
% Concluding the game 
%Saves a png file of the game that the user can view later
saveas(figure(1),'Picross.png')

% If there was no mistakes 
if incorrectAns == 0 
    disp('You win!');
    %Plays the rainbow animation
    for victoryAnimation = 1:10 %Repeats the animation
        for victory = 1:7 %Switches between colours
           hold on
            switch victory 
                case 1 %Make correct tiles red
                    %Updates colour map
                    colourBoard = ind2rgb(activeBoard+1,red);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 2 %Orange
                    colourBoard = ind2rgb(activeBoard+1,orange);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 3 %Yellow
                    colourBoard = ind2rgb(activeBoard+1,yellow);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 4 %Green
                    colourBoard = ind2rgb(activeBoard+1,green);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 5 %Blue 
                    colourBoard = ind2rgb(activeBoard+1,blue);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 6 %Pink
                    colourBoard = ind2rgb(activeBoard+1,pink);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
                case 7 %Purple
                    colourBoard = ind2rgb(activeBoard+1,purple);
                    imshow(colourBoard,'InitialMagnification','fit', ...
                        'Border','tight');
            end 

    
    dispGrid(boardSize,al); 
   [correctTiles,correctAns] = dispValues(boardSize,ansBoard,al,activeBoard); 
   [progress] = dispGui(correctTiles,incorrectAns,correctAns,boardSize,al);
   hold off
   pause(0.2); %Wait so flash isnt too quick
        end 
    
    end

else %If there were mistakes
    %
    fprintf('Game complete. You made %0.0f mistakes \n',incorrectAns);
    colourBoard = ind2rgb(activeBoard+1,black);
    imshow(colourBoard,'InitialMagnification','fit','Border','tight');
    hold on
    dispGrid(boardSize,al); 
    [correctTiles,correctAns] = dispValues(boardSize,ansBoard,al,activeBoard); 
    [progress] = dispGui(correctTiles,incorrectAns,correctAns,boardSize,al);
    hold off
    pause(5);
end 

hold off

close(1); %Closes game
%Display the gui
function [progress] = dispGui(correctTiles,incorrectAns,correctAns, ...
    boardSize,al)

%Determining font size of gui
if boardSize >= 7
    fontSizeVal = 7; 
else
    fontSizeVal = 10;
end 

%Extra spacing for text if boardSize = 10
if boardSize == 10
    spacing = 1;
else 
    spacing = 0; 
end 

hold on 
    %Displaying the number of mistakes
    text(al+0.7,(boardSize+al+0.7),'Mistakes','FontSize',fontSizeVal, ...
        'Color','k'); 
    mistake = string(incorrectAns); 
    text(al+0.8,(boardSize+al+0.9),mistake,'FontSize',fontSizeVal, ...
        'Color','k'); 
    %Display the progress
    text(al+1.6+spacing,(boardSize+al+0.7),'Progress','FontSize',fontSizeVal, ...
        'Color','k');
    progress = (correctAns/correctTiles)*100; 
    progress = string(progress); 
    text(al+2+spacing,(boardSize+al+0.9),progress,'FontSize',fontSizeVal, ...
        'Color','k', ...
        'HorizontalAlignment','center'); 
    %Display number of correct tiles
    text(al+2.6+(spacing*2),(boardSize+al+0.7),'Correct Tiles','FontSize',fontSizeVal, ...
        'Color','k'); 
    correctAns = string(correctAns);
    text(al+3.2+(spacing*2),(boardSize+al+0.9),correctAns,'FontSize',fontSizeVal, ...
        'Color','k'); 
    hold off
    %Display board size
    text(al+4+(spacing*3),(boardSize+al+0.7),'Board Size','FontSize',fontSizeVal, ...
        'Color','k'); 
    boardSizeString = string(boardSize); 
    text(al+4.4+(spacing*3),(boardSize+al+0.9),boardSizeString,'FontSize',fontSizeVal, ...
        'Color','k'); 

end 
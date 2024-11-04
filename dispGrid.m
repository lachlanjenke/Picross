%Display the grid over the board
function [] = dispGrid(boardSize,al)
    hold on

    %Generates the vertical lines
    for x = (al+0.5):1:(boardSize+al+0.5) 
        xx = [x x];
        yy = [(al+0.5) (boardSize+al+0.5)];
        plot(xx,yy,'Color','k');
    end
    
    %Generates the horizontal lines 
    for y = (al+0.5):1:(boardSize+al+0.5)
        xx = [(al+0.5) (boardSize+al+0.5)];
        yy = [y y];
        plot(xx,yy,'Color','k');
   
    end

    hold off
end 
%Displays the active board
function [] = dispBoard(activeBoard,colourMap)
   %Gives the board colours
   colourBoard = ind2rgb(activeBoard+1,colourMap);
   %Shows the board
   imshow(colourBoard,'InitialMagnification','fit','Border','tight');
end 
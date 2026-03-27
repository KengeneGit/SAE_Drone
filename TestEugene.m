close all
clearvars
clc
figure;
startManualControl;
keypressed = " ";

while keypressed ~= "space"
    keypressed=evalin('base','globalKeypressed');
   drawnow; 
end
fprintf("youpiiii");
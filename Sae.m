clearvars
close all
clc

setupDroneEnv;
tello=getTelloDrone();
tello.connect();

txt1 = input("Lancer le jeu ? Y/N : ","s");
if txt1 == 'Y'
    txt = input("Utiliser le temps Réel ? Y/N : ","s");
    if txt == 'Y'
        useRealTime = true;
    elseif txt == 'N'
        useRealTime = false;9
    end
    tello = telloSimulator(useRealTime);
    FD = flappyDrone(tello,viewMode=1,animFrequency=10,useRealTime=true,Ts=0.01);
    


elseif txt1 == 'N'
tello.takeoff();
bip(144);
figure;
startManualControl;
keypressed = " ";
while keypressed ~= "space"
drawnow;
manu=evalin('base','manu');
keypressed=evalin('base','globalKeypressed');
tello.send_rc_control(int8(0+manu.LR), int8(0+manu.FB), int8(0+manu.UD),int8(0+manu.Yaw));

end
end
tello.land()
stopManualControl;
tello.quit;
terminate(pyenv)








% load nonlienarity.mat;


% tello.takeoff();




% Te = 0.2; % période d'échantillonage
% Vect_Pos = [0];
% Start = tic;
% while (FD.isRunning)
%     if mod(toc(Start),Te) == 0
%         % Retrieve the current position of the drone
%         position = tello.getPosition();
% 
%     end
% end 
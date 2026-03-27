clearvars
close all
clc

useRealTime=true;
tello=telloSimulator(useRealTime);
 
FD=flappyDrone(tello,viewMode=2, ...
    animFrequency=10,useRealTime=useRealTime,Ts=0.2); ...
FD.start(4);
tello.connect();
 
fprintf('Take off\n')
tello.takeoff();
 
while FD.isRunning
   
    % Get the current setpoint
    Zc = FD.getSetpoint();
    
    % Get altitude from the drone
    pos=double(tello.get_position());
    Z=-pos(4);
   
    Kp =100; % à ajuster
    e = Zc - Z;
    Uz = Kp * e;
    % Send control to the drone
    FD.send_rc_control(0,0,Uz,0);
end
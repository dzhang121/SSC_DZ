clear all
close all
clc

%% magnetic compass setup
tr=0.4;
ts=18;
k=1; %sensitivity

w=1.02/tr;
eta=3/w/ts; %damping

a=1;
b=2*eta/w;
c=1/w^2;

e=0;
d=k;

%% heading input
tend = 20;
time = linspace(1,tend,1e3);
% data = 100*ones(1,length(time));%constant
% data = 100*sin(0.01*time); %low freq
data = 100*sin(1*time);%high freq
heading= [time' data'] ; 

%cutoff freq
omega0=1;
 
%run sim
%output as 2D array
set_param('final_system', 'StopTime', num2str(tend))
simout = sim('final_system.slx');

%plot
f1 = figure;
tab1 = uitab('Title','Heading');
axes('parent',tab1)
hold on
grid on
plot(simout.tout, simout.input)
plot(simout.tout, simout.fusion_out)
plot(simout.tout, simout.gyro_raw)
plot(simout.tout, simout.mag_raw)
hold off
legend('Input',...
    'Fusion Output',...
    'Gyro Compass Output',...
    'Magnetic Compass Output',...
    'Interpreter','none')

tab2 = uitab('Title','Error');
axes('parent',tab2)
hold on
grid on
plot(simout.tout, simout.fusion_out - simout.input)
plot(simout.tout, simout.gyro_raw - simout.input)
plot(simout.tout, simout.mag_raw - simout.input)
hold off
legend('Error of Sensor Fusion',...
    'Error of Gyro Compass',...
    'Error of Magnetic Compass',...
    'Interpreter','none')




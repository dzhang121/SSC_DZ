purge;

addpath("D:\Repos\Uni_SSC\DZ\Control_Week1\");

%setup
tend = 10;

m=1;exp
l=1;
g=9.81;

ki = 6; %integral - steady-state error - disturbance rejection
kp = 8; %proportional - position error - stiffness
kd = 0.9; %derivative = velocity error - damping

%step input (target angle)
t0=5;
initial_pos = 30; %deg
step_pos = 90; %deg
time = linspace(0,tend,1e3);
data = deg2rad(initial_pos .* heaviside(-(time-t0))) + deg2rad(step_pos .* heaviside(time-t0));
target = [time' data'];

%run sim
simout = sim('Wk2_Q1_PID.slx','StopTime', num2str(tend));

%plot
fnDrawPendulum(simout);


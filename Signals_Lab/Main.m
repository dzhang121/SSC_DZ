clear all
close all
clc

tR=0.4; tS=18; k=2;
w=1.02/tR;
eta = 3/w/tS;

a=1;
b=2*eta/w;
c=1/w^2;

e=0;
d=k;

% simout = sim('mains.slx');
simout = sim('mains_ramp.slx');

simout = simout.simout;

plot(simout)

hold on
x=[0:0.1:100];
plot(x,2*x-4*eta/w);
l=legend('Input','Response-simulink','Response-linear_assumption_ss')
set(l, 'Interpreter', 'none')

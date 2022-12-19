clear all
close all
clc

tr=0.4;
ts=18;
k=1; %sensitivity

w=1.02/tr;
eta=3/w/ts; %damping

a=1;
b=2*eta/w;
c=1/w^2;

heading=100; %heading

e=0;
d=k;

simout = sim('compass.slx');

simout = simout.simout;

plot(simout)

sys=tf([k],[c b a]);
figure
bode(sys)
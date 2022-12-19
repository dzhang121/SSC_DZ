clear all
close all
clc

k=1; %sensitivity, steady state response y=kt
tao=0.01;
simout = sim('threepointfour.slx');
simout=simout.simout;
figure;plot(simout)

sys=tf([k],[tao 1]);
figure
bode(sys)
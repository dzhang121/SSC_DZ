purge;

T=10;
x0=[-18;0;0.172];%[-10;0;0.172];

[t,x] = ode45(@Q7fn,[0 T], x0);

figure
plot(t,x)
legend('y','ydot','theta')
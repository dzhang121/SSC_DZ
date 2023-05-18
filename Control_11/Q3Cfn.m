function dot = Q7fn(t,xconsoladated)

x=xconsoladated(1:3);
xhat=xconsoladated(4:6);

%linerised controller:

delta_x = x-[0;0;0.171977404827849]; %condition of level flight, ie ydotdot=0

delta_u = [-0.2348 -0.3130 -7] * xhat;

u0=0;
u = delta_u + u0;

%nonlinear dynamics:
xdot = [
x(2)  
60*x(3)-100*x(3)^3-9.81
u
];

%linear observer
A=[0 1 0;0 0 51.12;0 0 0];
B=[0;0;1];
K=[-0.2347 -0.3130 -7];
C=[1 0 0];
L=[-630; -108000; -52817];
xhatdot = A*xhat+B*delta_u + L*(C*xhat - C* delta_x); %note the use of 
%deltax and delta u here because the system in this form is linerised

dot=[xdot;xhatdot];

end
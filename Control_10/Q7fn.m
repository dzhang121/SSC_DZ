function xdot = Q7fn(t,x)

%linerised controller:

delta_x = x-[0;0;0.171977404827849]; %condition of level flight, ie ydotdot=0

delta_u = [-0.2348 -0.3130 -7] * delta_x;

u0=0;
u = delta_u + u0;


%nonlinear dynamics:
xdot = [
x(2)  
60*x(3)-100*x(3)^3-9.81
u
];


end
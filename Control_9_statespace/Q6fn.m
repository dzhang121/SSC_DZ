function xdot = Q6fn(t,x)

x1=x(1);
x2=x(2);
x3=x(3);

xdot=[
0.7*x2
-(x2+x2.^3)+x3
-min(0.25,max(-0.25,x1+x2))
];


end
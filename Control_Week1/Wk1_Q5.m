purge;

T_end = 20;

u=1;
u0=1;
delta_u = u-u0;

x_init = 20; %initialisation point
x0=1;
delta_x_init = x_init-x0;
%linearized at x=1

nonlinear_xdot = @(t, x) (-sign(x)*abs(x)^(1/2) + u); 
[t_nl,x_nl] = ode45(nonlinear_xdot, [0,T_end], x_init);

linearised_xdot = @(t, delta_x) (-0.5*delta_x + delta_u);
[t_l,delta_x_l] = ode45(linearised_xdot, [0,T_end], delta_x_init);
%linearised solution is delta x, so to plot, need to add back x0

figure; 
plot(t_l,delta_x_l + x0);
hold on
plot(t_nl,x_nl);
legend('linearized','non-linear')
title(['Initial x0=' num2str(x0)])

%deltaX = X - X0
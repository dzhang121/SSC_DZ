
[t, v] = ode45(@dynamics, [0, 20], [10, 10, 10]);
plot3(v(:,1), v(:,2), v(:,3))
view([53 23]); xlabel('x'); ylabel('y'); zlabel('z');

function [vdot] = dynamics(t, v)
x = v(1); y = v(2); z = v(3);
sigma = 10; rho = 28; beta = 8 / 3;
vdot = [sigma * (y - x); x * (rho - z) - y; x * y - beta * z];
end
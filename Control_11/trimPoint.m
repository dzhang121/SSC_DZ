purge

x = optimvar('x',2);

% cosx=fun2optimexpr(@(x) cosd(x));

eq1 = exp(-exp(-(x(1) + x(2)))) == x(2)*(1 + x(1)^2);

eq2 = x(1)*cos(x(2)) + x(2)*sin(x(1)) == 1/2;


prob = eqnproblem;
prob.Equations.eq1 = eq1;
prob.Equations.eq2 = eq2;

x0.x = [0 0];
[sol,fval,exitflag] = solve(prob,x0)

disp(sol.x)
clear all


% load('d_Part1')
load('input_2_run3.mat')

figure
yyaxis left
plot(inputTime, input)
ylabel('Elevation Input')
yyaxis right
plot(outputTime, output)
ylabel('Elevation')
xlabel('Time (s)')

grid on


%% 
opt = stepDataOptions;
opt.StepAmplitude=2;
step(tf1,opt)

%% 
timetopeak = 3.35;
overshoot = (16.4152-10.8)/10.8;
k=10.8/2;

omega = optimvar('omega');
ksi = optimvar('ksi');
prob = eqnproblem;
prob.Equations.eq1 = pi/(omega*sqrt(1-ksi^2))==timetopeak;
prob.Equations.eq2 = exp((-ksi*pi)/(sqrt(1-ksi^2)))==overshoot;

x0.ksi=0.5;
x0.omega=1;
[sol,fval,exitflag] = solve(prob,x0);

tf1 = tf([k*sol.omega^2],[1 2*sol.omega*sol.ksi sol.omega^2]);

opt = stepDataOptions;
opt.StepAmplitude=2;

%sim
[y,t] = step(tf1,opt);

%measurement
idx = find(input~=0);
figure
yyaxis left
plot(inputTime(idx)-inputTime(idx(1)), input(idx))
ylabel('Elevation Input')
yyaxis right
plot(outputTime(idx)-inputTime(idx(1)), output(idx)-output(idx(1)))
ylabel('Elevation')
xlabel('Time (s)')

hold on
plot(t,y)
legend('input','measured output','sim output')
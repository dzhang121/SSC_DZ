purge;

%% polt
% load('d_Part1')
% load('input_2_run1.mat')
% load('input_2_run2.mat')
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


%% system ID - using system ID toolbox
% opt = stepDataOptions;
% opt.StepAmplitude=2;
% step(tf1,opt)

%% system ID - analytical method - second order model
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

%sim with step 2
opt = stepDataOptions;
opt.StepAmplitude=2;
[y,t] = step(tf1,opt);

y2=lsim(tf1,input,inputTime); %could either use lsim or step

%% first order model
K=5.5;
tau=4;
sys1st = tf([K],[tau,1]);

y1st=lsim(sys1st,input,inputTime);

% opt = stepDataOptions;
% opt.StepAmplitude=2;
% [y1st,t1st] = step(sys1st,opt);

%% plot test and sim data
idx = find(input~=0);
figure
hold on
% yyaxis left
plot(inputTime-inputTime(idx(1)), input)
ylabel('Elevation Input, Output')
% ylim([-1 3])
% yyaxis right
plot(outputTime-inputTime(idx(1)), output-output(idx(1)))
% ylabel('Elevation')
xlabel('Time (s)')

plot(t,y,'--')

plot(outputTime-inputTime(idx(1)), y1st-y1st(idx(1)))

legend('input','measured output','sim output','first order sim')

%% poles and zeros
sys=tf1;
p=pole(sys);
damping = cos(pi-angle(p(1)));
omega_d = imag(p(1));
T= 2*pi/omega_d;


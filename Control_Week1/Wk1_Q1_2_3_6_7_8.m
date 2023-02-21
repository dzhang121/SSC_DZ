purge;
%% Q1 - parameters for simulink Wk1_Q1.slx
%parameters
m=1;
l=1;
g=9.81;

%control input
tau=0; %how to setup a time-varying tau?

%initial conditions
Thetadot = 0;
Theta = pi/2;

simout = sim('Wk1_Q1.slx','StopTime', num2str(30));

figure
hold on
grid on
plot(simout.tout,simout.theta)
plot(simout.tout,simout.thetadot)
legend('\theta','\thetadot')

% plot the pendulum moving 
fnDrawPendulum(simout);

%% Q2&3
K = 1; %determines amplitude
Tau = 1; %control input - determines damping here??
system = tf([K],[Tau,1]); %1/(s+1)
step(system)

%sweep Tau
figure
for i=1:0.1:2
    Tau = i;
    system = tf([K],[Tau,1]); %1/(s+1)
    step(system)
    hold on
end
hold off
Tau=1;

%sweep K
figure
for i=1:5
    K = i;
    system = tf([K],[Tau,1]); %1/(s+1)
    step(system)
    hold on
end
hold off
K=1;


%% Q6-8
%replacing s to iw in the tf of 1/(s+1), or K/(Tau*s+1)
bode(system)

%manual calcs for compare:
omega = logspace(-2,2,100);
%MANUAL WAY:
% amplitude_response = K./(1+(Tau.*omega).^2).^0.5;
% phase_response = -atan(Tau.*omega);
%A BIT MORE CLEVER USING COMPLEX NUMBERS
Giomega = K.* 1./ (1 + 1i * Tau.* omega);
amplitude_response = abs(Giomega);
phase_response = angle(Giomega);

%
amplitude_response = abs(amplitude_response);
%

figure;hold on;
subplot(2,1,1)
semilogx(omega,20.*log10(amplitude_response))
subplot(2,1,2)
semilogx(omega,180./pi.*phase_response) %or use rad2deg

%% sweep Tau

figure
hold on
for Tau = logspace(0,2,8)
    bode(tf([K],[Tau,1]));
end

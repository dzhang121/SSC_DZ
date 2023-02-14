clear all
close all
clc

%% magnetic compass setup
% ref LAB guide P5-6

tr=0.4; %rise time
ts=18; %settling time
k=1; %sensitivity

w=1.02/tr;
eta=3/w/ts; %damping

a=1;
b=2*eta/w;
c=1/w^2;

e=0;
d=k;

magsys = tf([e d],[c b a]);
%% heading input 


tend = 140;

t = 0:0.01:tend;
% data = 100*ones(1,length(time));%constant
% data = 100*sin(0.01*time); %low freq
% data = 100*sin(1*time);%high freq

data = 0.* (t>=0&t<=30)+sin(2*pi*t).*(t>30&t<32) + sin(pi*t).*(t>=32&t<34) +0.*(t>=34&t<=40) ;

% figure;plot(t, data);
heading= [t' data'] ; 

%Used:
heading_gain = 5;


%cutoff freq
omega0=1;
 
%run sim
%output as 2D array
set_param('final_system', 'StopTime', num2str(tend))
simout = sim('final_system.slx');

%% plot
% figure;plot(simout.tout, simout.input)

f1 = figure;
tab1 = uitab('Title','Heading');
axes('parent',tab1)
hold on
grid on
plot(simout.tout, simout.input)
plot(simout.tout, simout.fusion_out)
plot(simout.tout, simout.gyro_raw)
plot(simout.tout, simout.mag_raw)
hold off
legend('Input',...
    'Fusion Output',...
    'Gyro Compass Output',...
    'Magnetic Compass Output',...
    'Interpreter','none')

% tab2 = uitab('Title','Error');
% axes('parent',tab2)
f2=figure;
set(gca,'FontSize',11)
hold on
grid on
plot(simout.tout, simout.fusion_out - simout.input,"LineWidth",2)
plot(simout.tout, simout.gyro_raw - simout.input,"LineWidth",1)
plot(simout.tout, simout.mag_raw - simout.input,"LineWidth",1)
hold off
lgd = legend('Fused System',...
    'Gyro Compass',...
    'Magnetic Compass',...
    'Interpreter','none');
lgd.FontWeight = "bold";
lgd.FontSize=11;
xl = xlabel("Time (s)");
yl = ylabel("Heading Error (°)");
xl.FontWeight = "bold";
xl.FontSize=12;
yl.FontWeight = "bold";
yl.FontSize=12;

%% calculate RMS
RMS=table;
RMS.Fused = rms(simout.fusion_out - simout.input); 
RMS.Gyro = rms(simout.gyro_raw - simout.input); 
RMS.Magnetic = rms(simout.mag_raw - simout.input); 


%% sweep break-frequency
Q1b = table;
i=0;
% %sweep cutoff freq
% for omega0=0:0.005:0.1
%     i=i+1;
%     clear simout
%     set_param('final_system', 'StopTime', num2str(tend))
%     simout = sim('final_system.slx');
%     Q1b.bf(i) = omega0;
%     %legacy - manual RMS calcs
% %     Q1b.RMS_error_fused(i) = sqrt( sum((simout.fusion_out - simout.input).^2.*(140/length(simout.tout)))/140 );
%     Q1b.RMS_error_fused(i) = rms(simout.fusion_out - simout.input);
% end

load("q1bdata.mat")
figure;plot(Q1b.bf, Q1b.RMS_error_fused,"LineWidth",2)

xl = xlabel("Break-frequency \omega (rad/s)");
yl = ylabel("RMS Error of Fused System (°)");
xl.FontWeight = "bold";
xl.FontSize=10;
yl.FontWeight = "bold";
yl.FontSize=10;
grid on

%% FFT of magnetic compass
% input
T = max(simout.tout)/length(simout.tout);
N = length(simout.tout);

DFT = fft(simout.input);

f = 0: 1/(N*T) : (N-1)/(N*T);

DFT_corrected = 2* abs(DFT(1:N/2))/N;

figure
loglog(f(1:N/2), DFT_corrected,"LineWidth",1,"color","#366718")
hold on

%output

% subplot(2,1,2)

DFT_m = fft(simout.mag_raw);

DFT_m_corrected = 2* abs(DFT_m(1:N/2))/N;

loglog(f(1:N/2), DFT_m_corrected,"LineWidth",1,"color","#edb222")

lgd2 = legend('Input','Magnetic compass');

% formatting
grid on
grid minor
grid minor

set(gca,'FontSize',11)
lgd2.FontWeight = "bold";
lgd2.FontSize=11;

xl = xlabel("Frequency (Hz)");
yl = ylabel("Magnitude (°s)");
xl.FontWeight = "bold";
xl.FontSize=11;
yl.FontWeight = "bold";
yl.FontSize=11;
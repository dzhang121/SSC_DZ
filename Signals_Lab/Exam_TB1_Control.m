clear all
close all
clc

%% Q5
%% Parameter
KT = 2.5E3;
CD = 1E-2;
CL = 3E-6;
m = 1;
I = 1E-3;
R = 5E-2;
L = 1E-6;
g = 9.81;

v0 = 0.525;
i0 = 3.27;
omega0 = 904;

%% Transfer function
G1 = tf([1],[L,R]); %1/(Ls+R)
G2 = tf([-1],[KT*L,KT*R]); %-1/[KT(Ls+R)]
G3 = tf([KT],[I,2*CD*omega0]); %KT/[Is+2CD*omega0]
G4 = tf([8*CL*omega0],[m,0,0]); %1/(m*s^2)
G = G1 * feedback(G3, G2, +1) *G4;
% G = (G1*G3*G4)/(1-G2*G3);

C = tf([0.025,0.5],[1]);%0.5+0.025s

sys = feedback(C*G,1,-1); %unity feedback of CG


%% Calculate poles and zeros
p = pole(sys);
z = zero(sys);

preal=real(p);
pimag=imag(p);

%% Q5 pz plot of closed loop system
plotoptions = pzoptions;
plotoptions.Grid = 'off';
% plotoptions.xLim = 'off';
pzplot(sys)
title("")
xl = xlabel("Real Axis");
xl.FontWeight = "bold";
xl.FontSize = 11;
yl = ylabel("Imaginary Axis");
yl.FontWeight = "bold";
yl.FontSize = 11;
set(findall(gcf,'type','line'),'linewidth',1)
axis equal



%% Q3 Q4
%CG open loop

CG=C*G;

plotoptions = pzoptions;
plotoptions.Grid = 'off';

pzplot(C*G,plotoptions)

xl = xlabel("Real Axis");
xl.FontWeight = "bold";
xl.FontSize = 11;
xl = ylabel("Imaginary Axis");
xl.FontWeight = "bold";
xl.FontSize = 11;
title("")


bode(CG);
grid on
xlim([1e-2 1e7])
title("")
set(findall(gcf,'type','line'),'linewidth',2)
set(gca,'FontSize',11)
set(gca,'FontWeight','bold')
xl = xlabel("Frequency");
xl.FontWeight = "bold";

%CG closed loop under unity feedback


%sensitivity
S = 1/(1+C*G);
F = C*G / (1+C*G);
wrange = {1e-2 1e7};

[mag,phase,wout] = bode(S,wrange);
Mag=20*log10(mag(:));Phase=phase(:);
figure(1);semilogx(wout,Mag,'LineWidth',2);grid on;
% figure(2);semilogx(wout,Phase,'LineWidth',1);grid on;
xlim([1e-2 1e7])
xl = xlabel("Frequency (rad/s)");
xl.FontWeight = "bold";
xl.FontSize = 11;
yl = ylabel("Magnitude (dB)");
yl.FontWeight = "bold";
yl.FontSize = 11;

[mag,phase,wout] = bode(F,wrange);
Mag=20*log10(mag(:));Phase=phase(:);
figure(2);semilogx(wout,Mag,'LineWidth',2);grid on;
xlim([1e-2 1e7])
xl = xlabel("Frequency (rad/s)");
xl.FontWeight = "bold";
xl.FontSize = 11;
yl = ylabel("Magnitude (dB)");
yl.FontWeight = "bold";
yl.FontSize = 11;
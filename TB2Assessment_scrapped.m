%% Q1
%b
a=0.5;
kT=6;
G=tf(1,[1/a,1])*tf(kT,[1/2,1]);
figure
rlocus(G)
%c
openloopzero = -4;
G=tf(1,[1/a,1])*tf(kT,[1/2,1])*tf([1,-openloopzero],1);
figure
rlocus(G)
%d & e
openloopzero = -3;
G=tf(1,[1/a,1])*tf(kT,[1/2,1])*tf([1,-openloopzero],1);
figure
rlocus(G)

s=tf('s');
Gdelayed=exp(-0.5*s)*G;
%or alternatively, G=tf([xxx],[xxx],'OutputDelay',0.5)
Gdelayed_modified = 0.05*exp(-0.5*s)*G;
figure;hold on
bode(G)
bode(Gdelayed)
bode(Gdelayed_modified)
legend('original','delayed','delayed_modified')

%note bode is only sufficient for proving stability
%to prove instability, need to use Nyquist, or step response of closed loop system
figure
step(feedback(G,1))
figure
step(feedback(Gdelayed,1))
figure
step(feedback(Gdelayed_modified,1))


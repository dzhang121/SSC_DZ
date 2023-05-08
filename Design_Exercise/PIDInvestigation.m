purge;

%% system G
sol=struct;
sol.ksi = 0.203825963059515; %damping ratio zeta
sol.omega = 0.957897868693921; %undamped natural frequency
k=10.8/2;
G=tf([k*sol.omega^2],[1 2*sol.omega*sol.ksi sol.omega^2]);

%% controller C
%% part1:  prescribe gains
ki=0.6;
kp=0.3;
kd=0.6;

C=tf([kd,kp,ki],[1 0]);
sys=feedback(C*G,1,-1);
step(sys)

%sweep kp
for kp=logspace(-1,1,5)
    C=kp;
    step(feedback(C*G,1,-1))
    hold on
end
hold off
rlocus(G)
%observations as kp increase:
%increase in frequency; reduction in damping; still stable; reduction in steady-state error
%%kp acts as stiffness

%sweep kd
kp=1;
for kd=logspace(-2,-1,5)
    C=tf([kd,kp],1);
    step(feedback(C*G,1,-1))
    hold on
end
hold off
%observations as kd increase:
%oscillation decay quicker
%increase in damping; decrease in settling time; 
%very small effect in frequency
%%kd act as damping

%sweep ki
kp=1;
kd=0;
for ki=logspace(-2,-1,5)
    C=tf([kd,kp,ki],[1 0]);
    step(feedback(C*G,1,-1));
    hold on
end
hold off
%observations as ki increase:
%converges quicker (less time for ss error to go to zero)
%more oscillatory, less stable, evnentually causes instability

%example controller in Q6
ki=1;
kp=200;
kd=25;
C=tf([kd,kp,ki],[1 0]);
sys=feedback(C*G,1,-1);
step(sys)
%ovservation:
%fast rise time; small overshoot; 
%iumpossible in practice (too quick), controller saturation

%% part2: design gains using root locus method 
%Correction on notation: G1 G2 here are actually C*G
% step1 %P %%%%%%%%%%%%%%
P = pzoptions;
P.XLim = [-10 1];
rlocusplot(G,P)
%test step response
k = 0.7; %need kp -> infinity
sys = feedback(k*G,1,-1);
step(sys)

% step 2 %need PI for the least %%%%%%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%turns out that there are always a pair of unstable assymptotes
%need to place another zero on the neg x-axis to drag the assymptotes to LHS of complex plane


% step 3 %turns out it needs PID %%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1 lambda2
% lambda1 = -0.5+1i;
% lambda2 = -0.5-1i; %k=0.7
lambda1 = -0.8+1i;
lambda2 = -0.8-1i; %k=2.29
C = tf([1 -(lambda1+lambda2) lambda1*lambda2],[1 0]) ; %K* (s-lambda1)*(s-lambda2) /s 
CG=C*G;
rlocus(CG)
grid on
%use patch to overlay the desired region
%step3,4 
%test step responseA
k = 2.29; 
%check gain values
ki=k*lambda1*lambda2
kp=-k*(lambda1+lambda2)
kd=k

CG2 = k*CG;
sys = feedback(CG2,1,-1);
p = pole(sys); hold on; plot(real(p),imag(p),'kx',MarkerSize=15,LineWidth=2)
figure; step(sys); xlim([0 5])
%reason for the issue at lambda=-2.5,-15, k=15: poles too close together, two poles interfering with each other, we don't have a single dominant pole

%sweep k
figure;hold on
for k=0.3:0.1:4
    step(feedback(k*CG,1,-1))
end
legend(cellfun(@num2str,num2cell([0.3:0.1:4]),'UniformOutput',false));
hold off


%% part3: design gains using bode method 

%% Analytical Validation
%Q1
figure;bode(CG)

loops=loopsens(G,C);
figure;bode(loops.Lo,'b',loops.Si,'r',loops.Ti,'g')
legend('open loop','sensitivity','complementary sensitivity')
grid on

%Q2
G1 = tf([5.089],[1,0.05821,1.131]);
G2 = tf([12.11],[1,0.2013,3.289]);
figure;hold on
step(feedback(C*G,1))
step(feedback(C*G1,1))
step(feedback(C*G2,1))
hold off
grid on
legend('G','G1','G2')

%pertubations in system dynamics (the +ve parts)
delta_G1=G1-G;
delta_G2=G2-G;
figure
bode(delta_G1,'r',delta_G2,'g')
grid on



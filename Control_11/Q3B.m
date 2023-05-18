purge
%note this is a linerised system, so all x refer to delta x
A=[0 1 0;0 0 51.12;0 0 0];
B=[0;0;1];
K=[-0.2347 -0.3130 -7];
C=[1 0 0];
L=[-630; -108000; -52817];

Anew = [A B*K; -L*C A+B*K+L*C];
sys=ss(Anew,[],eye(6),[]);

[y,t]=initial(sys,[-10;0;0;-10;0;0]);

figure
subplot(3,1,1)
plot(t,y(:,[1,4]))
legend('$x_1(t)$', '$\hat{x}_1(t)$',interpreter='latex')
subplot(3,1,2)
plot(t,y(:,[2,5]))
legend('$x_2(t)$', '$\hat{x}_2(t)$',interpreter='latex')
subplot(3,1,3)
plot(t,y(:,[3,6]))
legend('$x_3(t)$', '$\hat{x}_3(t)$',interpreter='latex')

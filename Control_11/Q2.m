purge

A=[-1 2;-3 -1];
B=[1;0];
C=[1 0];
L=[-108;-442.5];

Anew=[A zeros(2,2); -L*C A+L*C];
Bnew=[B;B];
sys=ss(Anew,Bnew,eye(4),[]);
% sys=ss(Anew,[],eye(4),[]);

[y,t]=initial(sys,[1;1;1.1;1.1]);

figure
subplot(2,1,1)
plot(t,y(:,[1,3]))
legend('$x_1(t)$', '$\hat{x}_1(t)$',interpreter='latex')
subplot(2,1,2)
plot(t,y(:,[2,4]))
legend('$x_2(t)$', '$\hat{x}_2(t)$',interpreter='latex')


% Q5a
 A=[0 1;-1 -1];
 B=[0;1];
 C=eye(2);
 D=[];

 sys = ss(A,B,C,D);

[x,t]=step(sys,20);


%Q5b
angle=45;
P=[cosd(angle) -sind(angle); sind(angle), cosd(angle)];
A2 = inv(P)*A*P;
B2 = inv(P)*B;
sys2 = ss(A2,B2,C,D);

[x2,t2]=step(sys2,20);


figure;
hold on
plot(t,x(:,1))
plot(t,x(:,2))
plot(t2,x2(:,1),'--')
plot(t2,x2(:,2),'--')
legend('x1','x2','x1b','x2b')
figure
hold on
plot(x(:,1),x(:,2))
plot(x2(:,1),x2(:,2),'--')
purge;

%continuous
T=50;
x0=[1; 0; -1];

[t,x] = ode45(@Q6fn,[0 T], x0);

figure
plot(t,x,'r')

%discrete
% clear all

T=50;
timestep=0.1;
timestep=0.01;%need about 10ms to get to good representations
t=[0:timestep:T]';
N=T/timestep+1;
x0=[1,0,-1];
x=nan(N,3);
x(1,:)=x0;
for i=2:N
    xdot = transpose(Q6fn(0,x(i-1,:)));
    x(i,:)=x(i-1,:)+timestep.* xdot;
end


hold on
plot(t,x,'b')
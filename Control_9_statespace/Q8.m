purge;

%exact discrete time representation
timestep=0.1; %better than Q6 with 100ms


T=40;

t=[0:timestep:T]';
N=T/timestep+1;

x0=[0,0,0];%step response

x=nan(N,3);
x(1,:)=x0;

A=[0 1 0;-1 0 1;-0.1 -0.5 -0.5];
B=[0;0;1];

Ad=expm(A*timestep);
Bd=(Ad-eye(3))*A^(-1)*B;

for i=2:N
    
    x(i,:)=Ad * (x(i-1,:))' + Bd * 1;
end

figure;
plot(t,x)

%continuous
sys=ss(A,B,eye(3),[]);
figure
step(sys)
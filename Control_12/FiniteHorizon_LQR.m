purge

A=[0 1;-1 0];
B=[0;1];
Q=[1 0;0 1];
R=[5];
QT=[10 0;0 10];

T=5;

% get P
QT=reshape(QT,length(A)*length(A),[]); %feed in a matrix

[tp,Pval]=ode45(@(t,P) fnFiniteHorizon(t,P,A,B,Q,R),[0 T],QT);

tp=T-tp;
figure
plot(tp,Pval)
xlabel('t')
ylabel('P')

%sim with U
[t,xval]=ode45(@(t,x) fnOptimalControl(t,x,A,B,R,tp,Pval),[0 T],[1 0]);
figure;plot(t,xval)

%alternatively for U
Anew = A-B*inv(R)*B'*P;
sys=ss(Anew,[],eye(2),[]);
initial(sys,[1 0])

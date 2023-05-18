purge

A=[0 1;-1 0];
B=[0;1];
Q=[1 0;0 1];
R=[5];

A=[0 1 0;0 0 0;4.905 0 -0.021]
B=[0 0;0 14.75;5E-7 0]
Q=[1 0 0; 0 0.5 0; 0 0 1];
R=[0.1 0;0 0.1];


M=[A' Q; B*(R\ (B')) -A];
[eigVec,eigVal]=eig(M);

% F = eigVec(1:2,3:4)
% S = eigVec(3:4,3:4)
% P = F*inv(S)

F = eigVec(1:3,[1 3 4])
S = eigVec(4:6,[1 3 4])
P = F*inv(S)

P=care(A,B,Q,R)

Anew = A-B*inv(R)*B'*P;
sys=ss(Anew,[],eye(2),[]);
initial(sys,[1 0])


K=-inv(R)*B'*P;

purge
%1b

A=[1 0 0;0 1 0;-1 -1 -1];
C=[0 1 1];
O=obsv(A,c);
rank(O)

N=null(O)

O*N

sys=ss(A,[],C,[]);
initial(sys,N)


%1c
A=[0 1 0;0 0 1; 0 -33 -14];
C=[2 1 0];
O=obsv(A,C)
rank(O)

%1d
A=[0 1 0;0 0 1; 0 -33 -14];
C=[22 13 1];
O=obsv(A,C)
rank(O)

N=null(O)

O*N

sys=ss(A,[],C,[]);
initial(sys,N)

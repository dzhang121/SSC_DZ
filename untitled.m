purge

sys=tf([1],[1,2,1,0]);
bode(sys)

A=[0 1 0;0 0 1 ; 0 -1 -1.414]
B=[0;0;1]
C=[1 0 0]

ctrb(A,B)
obsv(A,C)

K=[-2 -1 0.414]

A+B*K

A'
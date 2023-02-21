purge

%% Q2 (a)
G = tf(3,[10 1]);%(a)

%ASSUME RLOCUS FOLLOWS THE BLOCK DIAGRAM OF LECTURE 5 SLIDE 9, NOT THE
%MATLAB DOCUMENTATION

%P %%%%%%%%%%%%%%
P = pzoptions;
P.XLim = [-10 1];
rlocusplot(G,P)

%test step response
k = 26.7; 
CG = k*G;
sys = feedback(CG,1,-1);
step(sys)

%PD %%%%%%%%%%%%%
%step1 - choose lambda2
lambda2 = -4;
G2 = tf([1 -lambda2],[1]) * G; %K* (s-lambda2) *G
rlocus(G2)
%step2,3 - see sheet

%test step response
k = 20.9; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%PI %%%%%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1
lambda1 = -4;
G2 = tf([1 -lambda1],[1 0]) * G; %K* (s-lambda1)/s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 52.7; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%PID %%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1 lambda2
lambda1 = -4+1i;
lambda2 = -4-1i;
G2 = tf([1 -(lambda1+lambda2) lambda1*lambda2],[1 0]) * G; %K* (s-lambda1)*(s-lambda2) /s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 6.72; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%% Q2 (b)
G = tf(1,[1 0 0]);%(b)

%ASSUME RLOCUS FOLLOWS THE BLOCK DIAGRAM OF LECTURE 5 SLIDE 9, NOT THE
%MATLAB DOCUMENTATION

%P %%%%%%%%%%%%%%
P = pzoptions;
P.XLim = [-10 1];
rlocusplot(G,P)

%NOT VIABLE

%PD %%%%%%%%%%%%%
%step1 - choose lambda2
lambda2 = -4;
G2 = tf([1 -lambda2],[1]) * G; %K* (s-lambda2) *G
rlocus(G2)
%step2,3 - see sheet

%test step response
k = 5.78; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%PI %%%%%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1
lambda1 = -4;
G2 = tf([1 -lambda1],[1 0]) * G; %K* (s-lambda1)/s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 47.7; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)
%NOT STABLE??


%PID %%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1 lambda2
lambda1 = -4+1i;
lambda2 = -4-1i;
G2 = tf([1 -(lambda1+lambda2) lambda1*lambda2],[1 0]) * G; %K* (s-lambda1)*(s-lambda2) /s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 9.55; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)



%% Q2 (c)
G = tf(2,[1 1.5 0.5]);%(c)

%ASSUME RLOCUS FOLLOWS THE BLOCK DIAGRAM OF LECTURE 5 SLIDE 9, NOT THE
%MATLAB DOCUMENTATION

%P %%%%%%%%%%%%%%
P = pzoptions;
P.XLim = [-10 1];
rlocusplot(G,P)

%NOT VIABLE


%PD %%%%%%%%%%%%%
%step1 - choose lambda2
lambda2 = -4;
G2 = tf([1 -lambda2],[1]) * G; %K* (s-lambda2) *G
rlocus(G2)
%step2,3 - see sheet

%test step response
k = 6.08; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%PI %%%%%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1
lambda1 = -4;
G2 = tf([1 -lambda1],[1 0]) * G; %K* (s-lambda1)/s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 15; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


%PID %%%%%%%%%%
%step1 - add pole at 0
G1 = tf(1,[1 0])* G;
rlocus(G1)
%step2 - choose lambda1 lambda2
lambda1 = -4+1i;
lambda2 = -4-1i;
G2 = tf([1 -(lambda1+lambda2) lambda1*lambda2],[1 0]) * G; %K* (s-lambda1)*(s-lambda2) /s *G
rlocus(G2)
%step3,4 - see sheet

%test step response
k = 2.93; 
CG = k*G2;
sys = feedback(CG,1,-1);
step(sys)


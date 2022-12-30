purge;

s = [logspace(-2,2,1000) -logspace(-2,2,1000)].*i;
%% (a) F(s) = 1/(s+1)
G1 = 1./(s+1);
f1=figure;
ax1=axes;
p1 = plot(real(G1),imag(G1),'.');
ax1.XLim=[-1 1];
ax1.YLim=[-1 1];
title(ax1,"Nyquist Plot of F(s)");
axis(ax1,'square')
ax1.XGrid = 'on';
ax1.YGrid = 'on';
xline(0)
yline(0)

%validate
Gtf = tf(1,[1 1]); %1/(s+1)
sys = feedback(Gtf,1,-1);
impulse(sys)
%same:
tf1 = tf(1,1);%1
tf2 = tf([1 0],1);%s
sys = feedback(tf1,tf2,-1);%feedback loop
impulse(sys)

%% (b) F(s) = 1/(s^2-s+1)
G2 = 1./(s.^2-s+1);
f1=figure;
ax1=axes;
p1 = plot(real(G2),imag(G2),'.');
ax1.XLim=[-1 1];
ax1.YLim=[-1 1];
title(ax1,"Nyquist Plot of F(s)");
axis(ax1,'square')
ax1.XGrid = 'on';
ax1.YGrid = 'on';
xline(0)
yline(0)

%validate
Gtf = tf(1,[1 -1 1]); %1/(s+1)
sys = feedback(Gtf,1,-1);
impulse(sys)

%% (c) F(s) = (2s+1)/(s^2-s+1)
G3 = (2.*s+1)./(s.^2-s+1);
f1=figure;
ax1=axes;
p1 = plot(real(G3),imag(G3),'.');
ax1.XLim=[-3 3];
ax1.YLim=[-3 3];
title(ax1,"Nyquist Plot of F(s)");
axis(ax1,'square')
ax1.XGrid = 'on';
ax1.YGrid = 'on';
xline(0)
yline(0)

%validate
Gtf = tf([2 1],[1 -1 1]); %1/(s+1)
sys = feedback(Gtf,1,-1);
impulse(sys)
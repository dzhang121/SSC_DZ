function fnDrawPendulum(simout)

t=simout.tout;
theta = simout.theta .*180 ./ pi;
thetadot = simout.thetadot .*180 ./ pi;
theta_demand = simout.target .*180 ./ pi;

fps_real = length(t)/(t(end)-t(1));


%initialise plot
f1 = figure;
f1.OuterPosition = [200   200   1200   800];

s1 = subplot(2,2,1);
hold(s1,'on')
p11 = plot(0,0);
p12 = plot(0,0);
legend('\theta','\thetadot')
s1.XGrid='on';
s1.YGrid='on';
try
s1.XLim = [0,max(t)];
s1.YLim = [min(min(theta,thetadot))*1.2,max(max(theta),max(thetadot))*1.2];
end

s2 = subplot(2,2,3);
p2 = plot(0,0);
hold(s2,'on')
legend('\tau')
s2.XGrid='on';
s2.YGrid='on';
s2.XLim = [0,max(t)];
try
s2.YLim = [min(simout.tau)*1.2,max(simout.tau)*1.2];
end

s3 = subplot(2,2,[2 4]);
hold(s3,'on')
s3.XGrid='on';
s3.YGrid='on';
axis(s3,'square')
p32 = plot(0,0);
p32.LineStyle = "-";
p32.LineWidth = 1;
p32.Color = "r";
p3 = plot(0,0);
p3.LineStyle = "-";
p3.LineWidth = 2;
p3.Color = "k";
s3.XLim = [-1,1];
s3.YLim = [-1,1];

%loop each data point
for i=1:length(theta)
%plot theta and thetadot
    set(p11,"XData",t(1:i),"YData",theta(1:i))
    set(p12,"XData",t(1:i),"YData",thetadot(1:i))
    
    %plot tau
    try
        set(p2,"XData",t(1:i),"YData",simout.tau(1:i))
    end
    hold off
    
    %plot response visualisation
    x1=0;
    y1=0;
    x2 = cosd(theta(i)+90);
    y2 = sind(theta(i)+90);
    set(p3,"XData",[x1,x2],"YData",[y1,y2])

    try
    %plot demand visualisation
    x1=0;
    y1=0;
    x2 = 1.5*cosd(theta_demand(i)+90);
    y2 = 1.5*sind(theta_demand(i)+90);
    set(p32,"XData",[x1,x2],"YData",[y1,y2])
    end

    drawnow
    
%     pause(1/60) %fps=30
end

end
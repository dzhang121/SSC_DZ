load('d_Part3.mat')

figure(1)
plot(demandTime, demand)
hold on
plot(outputTime, output)
hold off
ylabel('Elevation')
xlabel('Time (s)')

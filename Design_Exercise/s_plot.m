load('d_Part1')

figure(1)
yyaxis left
plot(inputTime, input)
ylabel('Elevation Input')
yyaxis right
plot(outputTime, output)
ylabel('Elevation')
xlabel('Time (s)')

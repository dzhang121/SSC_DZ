inputTime = inputData.time;
input = inputData.signals.values;
outputTime = elevData.time;
output = elevData.signals.values;

save('input_2_run3', 'inputTime', 'input', 'outputTime', 'output');


figure
yyaxis left
plot(inputTime, input)
ylabel('Elevation Input')
yyaxis right
plot(outputTime, output)
ylabel('Elevation')
xlabel('Time (s)')

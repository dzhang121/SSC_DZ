inputTime = inputData.time;
input = inputData.signals.values;
outputTime = outputData.time;
output = outputData.signals.values;
demandTime = demandData.time;
demand = demandData.signals.values;
pitchTime = pitchData.time;
pitch = pitchData.signals.values;
travelTime = travelData.time;
travel = travelData.signals.values;

save('d_Part3', 'inputTime', 'input',...
                'outputTime', 'output',...
                'demandTime', 'demand',...
                'pitchTime', 'pitch',...
                'travelTime', 'travel');
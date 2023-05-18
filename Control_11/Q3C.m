purge;

T=10;
x0=[-10;0;0.172;-10;0;0];

[t,x] = ode45(@Q3Cfn,[0 T], x0);

figure
plot(t, x(:, [1:3]))
hold on
plot(t, x(:, [4:6]) + [0, 0, 0.172]) %xhat is actually delta xhat, depending on how you define it
hold off
legend('Altitude', 'Ascent Rate', 'Pitch Angle', 'Altitude Estimate', 'Ascent Rate Estimate', 'Pitch Angle Estimate')

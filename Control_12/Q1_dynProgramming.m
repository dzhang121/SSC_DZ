%% Q 1) a)

clear
clc

% Initialize arrays
karray = 0:5;
xarray = -4:4;
uarray = -1:1;
nx = length(xarray);
nk = length(karray);
V = zeros(nk, nx);
U = zeros(nk, nx);

%% Set value function in terminal state
k = nk;
for j = 1:nx %loop all 9 states
    x = xarray(j);
    V(k, j) = 10*x^2;
end

%% Apply dynamic programming
for k = nk-1:-1:1 %loop time steps
    for j = 1:nx %loop states
        x = xarray(j);
        possiblex = x + uarray;%stste
        possibleL = x^2 + uarray.^2;%stage cost
        possibleV = possibleL + interp1(xarray, V(k+1, :), possiblex);%value function = L(current time step)+V(next time step)
        [V(k, j), U(k, j)] = min(possibleV);
    end
end

%% Plot results
figure(1)
[Xarray, Karray] = meshgrid(xarray, karray);
contourf(Karray', Xarray', V')
xlabel('\it k')
ylabel('\it x_k')

%% Q 1) b)
x = zeros(nk, 1);
x(1) = 3;
for k = 1:nk-1
    j = find(xarray == x(k));
    u = uarray(U(k, j));
    x(k+1) = x(k) + u;
end

% Plot results
hold on
plot(karray, x, 'r')
hold off



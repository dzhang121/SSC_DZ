%% Clears all data
clear
clc
close all


%% q1a


% Initialize arrays
karray = 0:5;
xarray = -4:4;
uarray = -1:1;
nx = length(xarray);
nk = length(karray);
V = zeros(nk, nx);
U = zeros(nk, nx);

% Set value function in terminal state
k = nk;
for j = 1:nx
    x = xarray(j);
    V(k, j) = 10*x^2;
end

% Apply dynamic programming
for k = nk-1:-1:1
    for j = 1:nx
        x = xarray(j);
        possiblex = x + uarray;
        possibleL = x^2 + uarray.^2;
        possibleV = possibleL + interp1(xarray, V(k+1, :), possiblex);
        [V(k, j), U(k, j)] = min(possibleV);
    end
end

% Plot results
figure(1)
[Xarray, Karray] = meshgrid(xarray, karray);
contourf(Karray', Xarray', V')
xlabel('\it k')
ylabel('\it x_k')

%% Q1b
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


%% Q2a
A_2a = [0]
B_2a = [1]
Q_2a = [1]
Qt_2a = [10]
R_2a = [1]
n_2a = length(A_2a)
T = 5
Qt_2a = reshape(Qt_2a,n_2a,n_2a)
x0 = 3

[tP_2a,Pvals_2a] = ode45(@(t_2a,P_2a) f_q2a(t_2a,P_2a,A_2a,B_2a,Q_2a,R_2a), [0,T], Qt_2a)
tP_2a = T - tP_2a
figure
plot(tP_2a,Pvals_2a)

[t_2a,x_2a] = ode45(@(t_2a,x_2a) f_optimumctrl_2a(t_2a,x_2a,A_2a,B_2a,R_2a,tP_2a,Pvals_2a),[0,T],x0)


figure
subplot(1,2,1)
plot(t_2a,x_2a)
subplot(1,2,2)
plot(tP_2a,Pvals_2a)


%% q2b

A_2b = [0 1; 0.5 -0.5]
B_2b = [0; 1]
Q_2b = [1 0; 0 1]
Qt_2b = [10 0 ; 0 0]
R_2b = [0.1]
n_2b = length(A_2b)
T = 5
Qt_2b = reshape(Qt_2b,n_2b,n_2b)
x0_2b = [1;0]

[tP_2b,Pvals_2b] = ode45(@(t_2b,P_2b) f_q2b(t_2b,P_2b,A_2b,B_2b,Q_2b,R_2b), [0,T], Qt_2b)
tP_2b = T - tP_2b


[t_2b,x_2b] = ode45(@(t_2b,x_2b) f_optimumctrl_2b(t_2b,x_2b,A_2b,B_2b,R_2b,tP_2b,Pvals_2b),[0,T],x0_2b)



figure
subplot(1,2,1)
plot(t_2b,x_2b)
subplot(1,2,2)
plot(tP_2b,Pvals_2b)


%% q3a

CARE_3a = care(A_2a,B_2a,Q_2a,R_2a)

M_3a = [A_2a' Q_2a; B_2a*(R_2a\(B_2a')) -A_2a]
[V_3a,L_3a] = eig(M_3a)

F_3a = V_3a(1,2)
S_3a = V_3a(2,2)
P_3a = F_3a * inv(S_3a)
%% 3b
CARE_3b = care(A_2b,B_2b,Q_2b,R_2b)

M_3b = [A_2b' Q_2b; B_2b*(R_2b\(B_2b')) -A_2b]
[V_3b,L_3b] = eig(M_3b)
eigValues_3b = eig(M_3b)

L_3b_dia = diag(L_3b)
index_3b = real(L_3b_dia) > 0

F_3b = V_3b(1:2, [1,3])
S_3b = V_3b(3:4, [1,3])

F_3b_V2 = V_3b(1:2, index_3b)
S_3b_V2 = V_3b(3:4, index_3b)

P_3b = F_3b * inv(S_3b)

%% Slides

A_slide = [0 1; -1 0]
B_slide = [0;1]
Q_slide = [1 0; 0 1]
R_slide = [5]
Qt_slide = [10 0; 0 10]

M_slide = [A_slide' Q_slide; B_slide*(R_slide\(B_slide')) -A_slide]
[V_slide,L_slide] = eig(M_slide)
eigValues_slide = eig(M_slide)
F_slide = V_slide(1:2, 3:4)
S_slide = V_slide(3:4, 3:4)

%% 4a

A_4a = [0 1 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 1 0 0 
    0 0 0 0 9.81 0;
    0 0 0 0 0 1;
    0 0 0 0 0 0]

B_4a = [0 0; 1 0; 0 0 ; 0 0; 0 0; 0 1]

Q_4a = eye(6)
R_4a = [0.1 0; 0 0.1]

CARE_4a = care(A_4a,B_4a,Q_4a,R_4a)

M_4a = [A_4a' Q_4a; B_4a*(R_4a\(B_4a')) -A_4a]
[V_4a,L_4a] = eig(M_4a)
eigValues_4a = eig(M_4a)

L_4a_dia = diag(L_4a)
index_4a = real(L_4a_dia) > 0

F_4a = V_4a(1:6, index_4a)
S_4a = V_4a(7:12, index_4a)

P_4a = F_4a * inv(S_4a)

%% 4b

K = -inv(R_4a)*transpose(B_4a)*P_4a
[K_4b,S_4b,P_4b] = lqr(A_4a,B_4a,Q_4a,R_4a)


% Pass initial condtions x(0) = 1, y(0) = -1 and theta(0) = 0.1
[t,x] = ode45(@(t, x) f_dynamics_q4(t, x, K), [0,5], [0, -1, 0, 1, 0, 0.1]);

figure;
plot(t, x(:, [1,3,5]));
leg = legend('$y(t)$','$x(t)$','$\theta(t)$');
set(leg, 'interpreter', 'latex');
grid on;




%% Functions q2a

function[Pdot_2a] = f_q2a(t_2a,P_2a,A_2a,B_2a,Q_2a,R_2a)
n_2a = length(A_2a)
P_2a = reshape(P_2a,n_2a,n_2a)
Pdot_2a = Q_2a + P_2a*A_2a + A_2a'*P_2a - P_2a*B_2a*inv(R_2a)*B_2a'*P_2a
Pdot_2a = reshape(Pdot_2a,n_2a^2,[])
end

function[xdot_2a] = f_optimumctrl_2a(t_2a,x_2a,A_2a,B_2a,R_2a,tP_2a,Pvals_2a)
P_2a = interp1(tP_2a,Pvals_2a,t_2a)
n_2a = length(A_2a)
P_2a = reshape(P_2a,n_2a,n_2a)
u_2a = -R_2a\(B_2a'*P_2a*x_2a)
xdot_2a = A_2a*x_2a + B_2a*u_2a
end

%% Functions q2b

function[Pdot_2b] = f_q2b(t_2b,P_2b,A_2b,B_2b,Q_2b,R_2b)
n_2b = length(A_2b)
P_2b = reshape(P_2b,n_2b,n_2b)
Pdot_2b = Q_2b + P_2b*A_2b + A_2b'*P_2b - P_2b*B_2b*inv(R_2b)*B_2b'*P_2b
Pdot_2b = reshape(Pdot_2b,n_2b^2,[])
end

function[xdot_2b] = f_optimumctrl_2b(t_2b,x_2b,A_2b,B_2b,R_2b,tP_2b,Pvals_2b)
P_2b = interp1(tP_2b,Pvals_2b,t_2b)
n_2b = length(A_2b)
P_2b = reshape(P_2b,n_2b,n_2b)
u_2b = -R_2b\(B_2b'*P_2b*x_2b)
xdot_2b = A_2b*x_2b + B_2b*u_2b
end

%% Functions q4 
function [xout] = f_dynamics_q4(t,x,K)
%states [y, ydot, x, xdot, theta, thetadot]
x0 = [0; 0;  0; 0; 0; 0];
%control inputs
u0 =  [9.81; 0];
u  = K * (x - x0)  + u0;
%This is the original state (derivatives) space model from exSheet9
xout =  [x(2);
    u(1)*cos(x(5)) - 9.81;
    x(4);
    u(1)*sin(x(5));
    x(6);
    u(2)];
end


%% Define variables by extacting the time, x, and y position 
load('robpos.mat')
s = robpos; % Data from mat file contained in a 61x3 matrix
t = s(:, 1); % time from file in a 61x1 column vector
x = s(:, 2); % x position from file in a 61x1 column vector
y = s(:, 3); % y position from file in a 61x1 column vector

%% Defining variables for velocity and acceleration
sz = size(t);
v = zeros(sz); % declaring v to be a column of zeros with the same size as t
% v will hold the velocity of the robot at time t
a = zeros (sz); % declaring a to be a column of zeros with the same size as t
% a will hold the acceleration of the robot at time t

%% Plotting x and y position against time
figure(1)
subplot(3,1,1);
plot (t, x) % A graph of the x position over time 
title('X position vs Time'); xlabel('time'); ylabel('x position')

figure(1)
subplot(3,1,2); 
plot (t, y) % A graph of y position over time 
title('Y position vs Time'); xlabel('time'); ylabel('y position')

figure(1)
subplot(3,1,3); 
plot (x, y) % A graph of y position vs x position 
title('Y position vs X position'); xlabel('X position'); ylabel('y position')

%% Calculates velotity at time t
for i = 1:60
        v(i) = sqrt((x(i+1, 1)- x(i, 1))^2 + (y(i+1, 1)- y(i, 1))^2); %v(t) = Sqrt([𝑥(𝑡 + 1) − 𝑥(𝑡)]^2 + [𝑦(𝑡 + 1) − 𝑦(𝑡)]^2)
end  

%% 
% calculates Acceleration at time t

for i = 2:60
    a(i) = v(i)-v(i-1); % 𝑣(𝑡) − 𝑣(𝑡 − 1)
end
%% 
% Plotting V and A against time
figure(2)
subplot(2,1,1); plot(t, v)
title('Velocity vs Time'); xlabel('Time'); ylabel('Velocity')

figure(2)
subplot(2,1,2); plot(t, a);
title('Acceleration vs Time'); xlabel('Time'); ylabel('Acceleration')
%% Part B: polynomial curve fitting

p1 = polyfit(t, x, 20); %Fits x position to a polynomial function of time
fit_x = polyval(p1, t);

p2 = polyfit(t, y, 20); %Fits y position to a polynomial function of time
fit_y = polyval(p2, t);

figure(3)
plot(fit_x, fit_y); %Graph of polyfitted x position vs. y position
title('Polyfitted x & y position'); xlabel('X position'); ylabel('Y position')

%%
%Fitted velocity graph
fit_v = zeros(sz);
for i = 1:60
        fit_v(i) = sqrt((fit_x(i+1, 1)- fit_x(i, 1))^2 + (fit_y(i+1, 1)- fit_y(i, 1))^2); %v(t) = Sqrt([𝑥(𝑡 + 1) − 𝑥(𝑡)]^2 + [𝑦(𝑡 + 1) − 𝑦(𝑡)]^2)
end 
figure(4);
subplot(2,1,1); plot (t, fit_v);
title('Fitted Velocity vs Time'); xlabel('Time'); ylabel('Velocity')

%Fitted Acceleration graph
fit_a = zeros(sz);
for i = 2:60
    fit_a(i) = fit_v(i)- fit_v(i-1); % 𝑣(𝑡) − 𝑣(𝑡 − 1)
end
figure(4);
subplot(2,1,2); plot (t, fit_a);
title('Fitted Acceleration vs Time'); xlabel('Time'); ylabel('Acceleration')


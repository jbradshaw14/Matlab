clear
close
clc

% %% This code will solve the ode
% %  (1-x^2)*y'' - 2*x*y' + n*(n+1)*y = 0
% %  using ODE45
% 
% %% Create initial vars
 x = linspace(-0.9,0.9,5);
 n = [1 2 3 4 5]; 
 tspan = [0,5];
 y0 = [-0.9000
        0.7150
       -0.4725
        0.2079
        0.0411];
dydx0 = [ 1
         -2.7
          4.575
         -6.0075
          6.4464];

%% Create for loop and initialize first graph
Y0 = [y0(1) dydx0(1)];
[t,y] = ode45(@(t,y) John_Bradshaw_Q1_func(t,y,x,n),tspan,Y0);
%% create figure and plot
figure(1); 
plot(t,y(:,1));
xlabel('x','fontsize',18);
ylabel('y','fontsize',18);
title('Legender''s ODE');
hold on;

for i = 2:length(n) % start at n = 2 since we already have n = 1 plotted

 Y0 = [y0(i) dydx0(i)];

% %% call ode 45 to calculate, in a for loop with n iterations

[t,y] = ode45(@(t,y) John_Bradshaw_Q1_func(t,y,x,n),tspan,Y0);
plot(t,y(:,1));
end
% add legend
legend('y @ n=1','y @ n=2','y @ n=3','y @ n=4','y @ n=5');






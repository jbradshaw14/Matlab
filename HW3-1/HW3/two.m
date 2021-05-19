clear
close
clc

%% This code plots the cylinder 
%  defined by z = 4 - x^2 on the 2nd quad

%% Create vars
r = 2; % radius
n = 500; % number of subdivisions

%% Create mesh of cylinder
[X,Y,Z] = cylinder(r,n);

%% Plot the cylinder
fig1 = figure(1);
fig1.WindowState = 'maximized';
surf(X,Y,Z);
axis([-2 0,0 2,0 1]); % 2nd quadrant range
title1 = title('Cylinder in 2nd Quadrant');
title1.Interpreter = 'latex';
title1.FontSize = 20;
xlab = xlabel('X');
xlab.FontSize = 16;
ylab =  ylabel('Y');
ylab.FontSize = 16;
zlab = zlabel('Z');
zlab.FontSize = 16;



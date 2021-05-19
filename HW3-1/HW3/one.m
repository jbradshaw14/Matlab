clear
close
clc

%% This code calculates and plots the Sine Cardinal
% function sinc(cos(r)) as a function of r given r = x^2+y^2

%% Define variables
x = linspace(0,2*pi,100);
y = linspace(0,2*pi,100);
%% Define f as a funcion of x & y
f = @(x,y) sqrt(x.^2 + y.^2);

%% Create a meshgrid of x & y for the 3d plot 
[X,Y] = meshgrid(x,y);
clear x y;

R = f(X,Y); % Plug meshgrid data into fn

%% Define sinec
Z = sinc(cos(R));

%% Plot the function
fig1 = figure(1);
axes1 = gca;
plotz = surf(X,Y,Z);
plotz.DisplayName = '$z(x,y) = {sinc(cos(r))}$';
title1 = title('Sine Cardinal as a Function of Cos(r)');
title1.Interpreter = 'latex';
title1.FontSize = 20;
xlab = xlabel('x');
xlab.FontSize = 16;
ylab = ylabel('y');
ylab.FontSize = 16;
zlab = zlabel('z');
zlab.FontSize = 16;
% Create legend
leg1 = legend('show');
leg1.Interpreter = 'latex';
leg1.Location = 'northwest';
% Create colorbar
clrbar = colorbar('peer',axes1);


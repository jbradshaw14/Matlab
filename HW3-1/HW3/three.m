clear
close
clc

%% This code wil plot the 3D object created by rotation of 
%  x = 1 + cos(z) for 0<=z<=2*pi curve around the z axis

%% Define z, x, and n
z = linspace(0,2*pi,100);
x = 1 + cos(z);
n = 50; % number of subdivisions
%% Create 3D mesh
[X,Y,Z] = cylinder(x,n);

%% Plot the object
surf(X,Y,Z);
axis square;
colormap default;
title1 = title('Rotation of x = 1 + cos(z) about the z axis');
title1.Interpreter = 'latex';
title1.FontSize = 16;
xlab = xlabel('X');
xlab.FontSize = 16;
ylab =  ylabel('Y');
ylab.FontSize = 16;
zlab = zlabel('Z');
zlab.FontSize = 16;
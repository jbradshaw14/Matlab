clear
close
clc

%% This code shows 3 structers from an AFM image
%  and creates a 3d plot for each
%  with an additional plot as a reference

height_range = 100; % assume a height of 100%
pixel_siz1e_5 = 5/34; % nanometers/pixel
pixel_siz1e_20 = 20/34; 
%% Read image data
    im1 = imread('afmStruc.jpg');
    im2 = imread('afmStruc1.jpg');
    im3 = imread('afmStruc2.jpg');
    im4 = imread('afmStruc3.jpg');



%% CONVERT THE IMAGE TO GRAYSCALE
    im_gray1 = rgb2gray(im1);
    im_gray2 = rgb2gray(im2);
    im_gray3 = rgb2gray(im3);
    im_gray4 = rgb2gray(im4);

%% Plot Data as a surface
    z1 = double(im_gray1); % Shade intensity will corrospond to data height
    data_range1 = [min(min(z1)) max(max(z1))];
    z2 = double(im_gray2);
    data_range2 = [min(min(z2)) max(max(z2))];
    z3 = double(im_gray3); 
    data_range3 = [min(min(z3)) max(max(z3))];
    z4 = double(im_gray4);
    data_range4 = [min(min(z4)) max(max(z4))];

% Make the data start from 0
    z1 = z1 - min(min(z1));
    z2 = z2 - min(min(z2));
    z3 = z3 - min(min(z3));
    z4 = z4 - min(min(z4));

% Divide z1 by its range to make it go from 0 to 1, then multiply
% by 100 nm
    z1 = z1 / data_range1(2) * height_range;
    z2 = z2 / data_range2(2) * height_range;
    z3 = z3 / data_range3(2) * height_range;
    z4 = z4 / data_range4(2) * height_range;

%% Modify x & y to represent real dimensions
    %Create x & y going from 1 to the proper dimension of Z
        x1 = 1:size(z1,2);
        y1 = 1:size(z1,1);
        x2 = 1:size(z2,2);
        y2 = 1:size(z2,1);
        x3 = 1:size(z3,2);
        y3 = 1:size(z3,1);
        x4 = 1:size(z4,2);
        y4 = 1:size(z4,1);
        
    % Modify x & y to represent real dimensions
        x1 = pixel_siz1e_5*(x1-min(x1));
        y1 = pixel_siz1e_5*(y1-min(y1));
        x2 = pixel_siz1e_20*(x2-min(x1));
        y2 = pixel_siz1e_20*(y2-min(y1));
        x3 = pixel_siz1e_20*(x3-min(x1));
        y3 = pixel_siz1e_20*(y3-min(y1));
        x4 = pixel_siz1e_5*(x4-min(x1));
        y4 = pixel_siz1e_5*(y4-min(y1));

    % Create a mesh grid
        [X1, Y1] = meshgrid(x1,y1);
        [X2, Y2] = meshgrid(x2,y2);
        [X3, Y3] = meshgrid(x3,y3);
        [X4, Y4] = meshgrid(x4,y4);

%% Plot it as a surface
    fig1 = figure(1);
    fig1.WindowState = 'maximized';
    surf(X1,Y1,z1);
    colormap default;
    ti = title('3D surface of an afm image');
    ti.Interpreter = 'latex';
    ti.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z %');
    zlab.FontSize = 16;
    colorbar('peer',gca);

    fig2 =figure(2);
    surf(X2,Y2,z2);
    fig2.WindowState = 'maximized';
    colormap default;
    ti = title('3D surface of an afm image');
    ti.Interpreter = 'latex';
    ti.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z %');
    zlab.FontSize = 16;
    colorbar('peer',gca);

    fig3 = figure(3);
    surf(X3,Y3,z3);
    fig3.WindowState = 'maximized';
    colormap default;
    ti = title('3D surface of an afm image');
    ti.Interpreter = 'latex';
    ti.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z %');
    zlab.FontSize = 16;
    colorbar('peer',gca);

    fig4 =figure(4);
    surf(X4,Y4,z4);
    fig4.WindowState = 'maximized';
    colormap default;
    ti = title('3D surface of an afm image');
    ti.Interpreter = 'latex';
    ti.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z %');
    zlab.FontSize = 16;
    colorbar('peer',gca);


clear 
close 
clc

%% This code plots a 3d surface of an AFM image
%  Create pixel size and height range vars
%  511 pixels is 20 micrometers in the figure
%  the height range is 0 to 400 nm

height_range = 400;
pixel_size = 20/511; % micrometers/pixel

%% Read image data
    im = imread('data.jpg');

%% Convert image data to grayscale
    im_gray = rgb2gray(im);
    clear im;

%% Create surface data
    z = double(im_gray);
    data_range = [min(min(z)) max(max(z))];
    % make z go from 0 to 400 nm
    z = z - min(min(z));
    Z = z / data_range(2) * height_range;
    clear data_range height_range ;

%% Break into x y & z
    x = 1:size(z,2);
    y = 1:size(z,1);

    % Modify x and y to have real dimensions
    x = pixel_size*(x-min(x));
    y = pixel_size*(y-min(y));

%% Create Meshgrid
    [X,Y] = meshgrid(x,y);
    clear x y z

%% Display surface data  with a figure
    fig = figure(1);
    fig.WindowState = 'maximized';
    surf(X,Y,Z);
    colormap default;
    ti = title('John Bradshaw');
    ti.FontSize = 18;
    ti.Interpreter = 'latex';
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 18;
    ylab = ylabel('Y({\mu})');
    ylab.FontSize = 18;
    zlab = zlabel('Z(nm)');
    zlab.FontSize = 18;
    colorbar('peer',gca);
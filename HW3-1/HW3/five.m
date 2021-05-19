clear
close
clc

%% This code plots a 3D figure
%  511 pixles is 20 micrometers in the figure
%  the height range is 0 to 400 nm

height_range = 400;
pixel_size = (20/511); %% micrometers/pixel

%% Read image data
    im = imread('afm2.jpg');
   
%% Covert the image to grayscale
im_gray = rgb2gray(im);

%% Plot data as a surface
    z = double(im_gray);
    data_range = [min(min(z)) max(max(z))];
    % make z go from 0 to 200 nm
    z = z - min(min(z));
    Z = z / data_range(2) * height_range;

%% Break data into x y and z
    x = 1:size(z,2);
    y = 1:size(z,1);
    % Modify x and y to have real dimensions
    x = pixel_size*(x-min(x));
    y = pixel_size*(y-min(y));

   % create meshgrid
   [X,Y] = meshgrid(x,y);
   clear x y;

% Display data as a surface
    fig1 = figure(1);
    fig1.WindowState = 'maximized';
    surf(z);
    colormap default;
    title1 = title('3D surface of an afm image');
    title1.Interpreter = 'latex';
    title1.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z(nm)');
    zlab.FontSize = 16;
    colorbar('peer',gca);
 
    
    fig2 = figure(2);
    fig2.WindowState = 'maximized';
    surf(-1.*X,-1.*Y,Z);
    colormap default;
    title1 = title('3D surface of an afm image - alt veiw');
    title1.Interpreter = 'latex';
    title1.FontSize = 20;
    xlab = xlabel('X({\mu}m)');
    xlab.FontSize = 16;
    ylab =  ylabel('Y({\mu}m)');
    ylab.FontSize = 16;
    zlab = zlabel('Z(nm)');
    zlab.FontSize = 16;
    colorbar('peer',gca);



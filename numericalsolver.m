clear
close
clc

%% Use traditional numerical methods: addition, subtration and multiplicaiton, if else, and while loops
 % to solve the funciton x^3 +2x^2 + x + x^(1/2) = 102
%% Create inline function
f = @(x)x.^3 + 2*x.^2 + x + x.^(1/2) - 102;

%% Plot the Function
fig = figure(1);
fig.WindowState = 'maximized';
X = linspace(-10,10,100);
Y = f(X);
pl = plot(X,Y);
pl.Color = 'blue';
pl.DisplayName = 'f(x)';
ti = title('$f(x) =  x^3 +2x^2 + x + \sqrt{x} - 102 $');
ti.FontSize = 20;
ti.Interpreter = 'latex';
xl = xlabel('$x$');
xl.FontSize = 20;
xl.FontWeight = 'bold';
xl.Interpreter = 'latex';
yl = ylabel('$f(x)$');
yl.FontSize = 20;
yl.FontWeight = 'bold';
yl.Interpreter = 'latex';
hold on;
% add annotaion (instructions)
annotation(fig,'textbox',...
    [0.25 0.65 0.15 0.05],...
    'String',{'Click on the graph to find the','zero of the function'},...
    'FontSize',20,...
    'Interpreter','latex',...
    'FitBoxToText','on',...
    'EdgeColor','none',...
    'Tag','Instructions');
clear X Y

%% Use the input command to get input from the user
x = ginput(1);
% Round whatever the input is to a whole number to make the program more accurate and faster
x = round(x(1)); 
y = f(x);

% These will count how many loops the computer went through.
counter1 = 0;
counter2 = 0;
counter0 = 0;

%% Begin while loop
 % Check if the y is zero
while y ~= 0 

    % if not, subtract one from the starting x
    if  y > 0
    x = x - 1;
    y = f(x);
    counter1 = counter1 + 1;

    % Otherwise, add one to it...
    elseif y < 0
    x = x + 1;
    y = f(x);
    counter2 = counter2 + 1;
    
        % If its between two whole numbers, narrow the search...otherwise skip this step    
        if counter1 > 0 && counter2 > 0
            counter0 = 1;
            x = x - 1;
            y = f(x);
            decr = 0.0001; % start at the bottom and work your way up.
                while y < 0
                x = x + decr;
                y = f(x);
                counter0 = counter0 + 1;
                end
            break;
        end
    end
end

%% mark the location of zero
pl2 = plot(x,y);
pl2.Marker = 'o';
pl2.MarkerSize = 20;
% Delete the instructions
delete(findall(fig,'Tag','Instructions'));
% Create annotation to display the value of x 
annotation(fig,'textbox',...
            [0.25 0.65 0.15 0.05],...
            'String',{['The value of $x$ at $y = $ ' num2str(y) ' is ' num2str(x)]},...
            'FontSize',20,...
            'Interpreter','latex',...
            'FitBoxToText','on',...
            'EdgeColor','none');

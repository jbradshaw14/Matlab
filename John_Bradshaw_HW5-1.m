clear
close
clc

%% This program finds the zero of x^3-x using Newton's Method
    %  Create inline function and its derivative
    f = @(x) x.^3-x;
    fprime = @(x) 3*x^2 + 1;
    
    % Get user input of initial guess
    x0 = input('guess = ');
    % Set tolerence value
    min_tol = 10^-9;
    
    % Start for loop
    tic
    for i = 1:1000
    y = f(x0);
    yprime = fprime(x0);
    % Newtons Method 
    x1 = x0 - y/yprime;
    % If the value is within our tolerence, break out of the loop
    if abs(x1) < min_tol
        break;
    else
        x0 = x1; % do another iteration otherwise
    end
    end
    
    % Display the result
    toc
    disp(['f(x) = 0 at x = ' num2str(x1)]);
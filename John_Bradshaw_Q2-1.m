clear
close
clc

%% This code will numericlly solve the equation
%  f(x)= 1 + x + x^/2 + x^3/6
%% define inline functions
f = @(x) 1 + x + x.^2/2 + x.^3/6;

%  Define the derivative of the function to use newtons method
dydx = @(x) 1 + x + x^.2/2;
%% Create initial vars
x = [0 5];
x0 = 5; % start at 5
% define tolerence
tol = 10^-12;

%% calculate using Newton's Method using while loop
for i = 1:100
   y = real(f(x0));
   yprime = real(dydx(x0));
   x1 = x0 - y/yprime; % definition of Newton's Method
   yabs = abs(y);
    if yabs < tol + 13
        break;
    else
        x0 = x1;    
    end
end

%% Plot 
figure(1);
plot(x,f(x));
xlabel('x','fontsize',18);
ylabel('y','fontsize',18);
title(['The value is ' num2str(x0) ' for ' num2str(f(x0)) ' in ' num2str(i) ' iterations'],...
       'fontsize',18);
hold on
plot(x0,f(x0),'o','markersize',10);

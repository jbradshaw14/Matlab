function dydx = John_Bradshaw_Q1_func(t,y,n,x)
%% This function calculates dydx for the Legender ODE

%  Seperate y vector 
 y1 = y(1);
 y2 = y(2);
 
%% Calc dydx
dydx = [y2
        (2*x.*y2 - n.*(n+1).*y1)/(1-x.^2)];
end
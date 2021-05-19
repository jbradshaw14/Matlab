%
clear all, close all, clc

t = 0:0.01:10; % time

wr = 60 + 0*t; % reference speed (mph)
d = 10*sin(pi*t); % disturbeance value

% y = actual speed, u = fuel input
a_Model = 2; % y = aModel*u y=2*u
a_True = 1.; % y =atrue*u

% Open Loop Model (high error)
uOL = wr.Model; % Open-loop u based on model 
yOL = aTrue*uOL + d % Open loop response

% Closed Loop Model (low error)
K = 50; % control GAIN, u=k(wr-y), error = wr-y
% Closed loop equation
yCL = aTrue*K/(1+aTrue*K)*wr + 1/(1/+aTrue*K)*d


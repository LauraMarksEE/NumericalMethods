% Usage: [y t] = heun(f,a,b,ya,n) or y = heun(f,a,b,ya,n)
% Heun's (or 'explicit trapezoid') method for initial value problems
%
% Input:
% f - Matlab inline function f(t,y)
% a,b - interval
% ya - initial condition
% n - number of subintervals (panels)
%
% Output:
% y - computed solution
% t - time steps
%
% Examples:
% [y t]=heun(@myfunc,0,1,1,10);          here 'myfunc' is a user-defined function in M-file
% y=heun(inline('sin(y*t)','t','y'),0,1,1,10);
% f=inline('sin(y(1))-cos(y(2))','t','y');
% y=heun(f,0,1,1,10);

function [y t] = heun(f,a,b,ya,n)
h = (b - a) / n;
halfh = h / 2;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    t(i+1) = t(i) + h;
    g = f(t(i),y(i,:));
    z = y(i,:) + h * g;
    y(i+1,:) = y(i,:) + halfh * ( g + f(t(i+1),z) );
end;
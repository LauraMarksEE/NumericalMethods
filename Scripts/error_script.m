ti = 0; 
qi = 500*10^-9;
tf = 1*10^-3;

R = 1000;
C = 100*10^-9;
A = 2*pi/(100*10^-6);
Vin = @(t) 5*cos(A*t);

Beta = sqrt (1 + (A*R*C)^2) ;
Theta = atan (A*R*C) ;
z = (5*C)*(1 - (1/Beta)*cos(Theta)) ;

func = @(t,q) (1/R)*(Vin(t) - (1/C)*q);
h1 = []; 
m1 = []; 

for i= 1:9
    h = 1*10^(-i);
    h1 = [h1; h];
    [tt, qq] = RK2_func(func, ti, qi, h, tf);
    exact = (5/Beta)*cos(A*tt - Theta) + (z/C)*exp(-tt/(R*C));
    maxerror = max(abs(exact - (qq/C)));
    m1 = [m1; maxerror];
end


exact = (5/Beta) * cos (A*tt - Theta) + (z/C)*exp(-tt/(R*C));
plot(tt, exact);
hold on;
% title("Exact Solution");

plot(tt,qq/C);
title("Numerical Method");

% loglog(h1, m1);

% error = exact - qq/C ;
% plot(tt, error);
% title("Error")